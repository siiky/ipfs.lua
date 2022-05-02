local http = require('./http') -- https://luarocks.org/modules/daurnimator/http
local util = require('./util')

function array_to_query(array)
  if #array == 0 then return "" end

  local r, i = {}, 0
  for j, kv in ipairs(array) do
  	i = i + 1
  	r[i] = http.util.encodeURIComponent(kv[1]).."="..http.util.encodeURIComponent(kv[2])
  end

  return table.concat(r, "&", 1, i)
end

-- The Type functions should return a string to be used as a value in the query
-- string of the request.

function Bool(v)
  if v then
    return 'true'
  else
    return 'false'
  end
end

function Int(v)
  if type(v) == 'number' then
    return tostring(v)
  else
    return nil
  end
end

function UInt(v)
  if type(v) == 'number' and v >= 0 then
    return tostring(v)
  else
    return nil
  end
end

function String(v)
  if type(v) == 'string' then
    return v
  else
    return nil
  end
end

function Array(t)
  return function(v)
    if type(v) ~= 'table' then return nil end

    v = util.map(t, v)
    if util.all(function(x) return x ~= nil end, v) then
      return v
    else
      return nil
    end
  end
end


-- Check that a required argument is present
function Yes(v)
  return v ~= nil
end

-- No need to check optional arguments
function No(v)
  return true
end

function failed(msg)
  return msg, nil, nil, nil
end

function functable(f)
  local ret = {}
  setmetatable(ret, { __call = function(tbl, ...) f(...) end })
  return ret
end

-- @brief Make the actual request.
-- @param ipfs An IPFS instance.
-- @param endpoint The API endpoint, excluding the "/api/v0/" prefix.
-- @param arguments Array of positional arguments.
-- @param parameters Table of optional parameters.
-- @param options Per-request options: `reader`, `writer`, `timeout`.
-- @returns body, status, headers, stream
--
-- `body` is the reply's body. If there is no reader, it's returned as a
--   string; if there is a reader, it's the result of applying the reader to
--   the body as a string.
-- `status` is the reply's HTTP status code.
-- `headers` are the reply's HTTP headers.
-- `stream` is the reply's body, as returned by the `http` library.
--
-- @see For terminology details: https://docs.ipfs.io/reference/http/api
function call_api_endpoint(ipfs, endpoint, arguments, parameters, options)
  local query = array_to_query(
    util.append(
      util.map(function(v) return {"arg", v} end, arguments),
      util.table_to_entries(parameters)
    )
  )

  local headers = http.headers.new()
  headers:append(':method', "POST")

  local request = http.request.new_from_uri({
    scheme = ipfs.scheme,
    host = ipfs.host,
    port = ipfs.port,
    path = "/api/v0/" .. endpoint,
    query = query,
  }, headers)

  if options.writer then
    request:set_body(options.writer)
  end

  local headers, stream = assert(request:go(options.timeout or ipfs.timeout))

  local status = headers:get(':status')
  local body
  if status == '200' then
    if type(options.reader) == 'function' then
      body = options.reader(assert(stream:get_body_as_string()))
    end
  else
    -- Return the error message for convenience.
    body = assert(stream:get_body_as_string())
  end

  return body, status, headers, stream
end


return function(tbl)
  local reader_json = tbl.reader_json
  local reader_plain = tbl.reader_plain

  function make_ipfs_endpoint(
    endpoint,
    default_reader,
    --default_writer,
    arguments_spec,
    parameters_types
  )
    if type(endpoint) ~= 'string' then
      error "`endpoint` must be a string"
    end

    arguments_spec = arguments_spec or {}
    parameters_types = parameters_types or {}

    local is_required = {}
    local arguments_types = {}
    for i, tr in pairs(arguments_spec) do
      table.insert(arguments_types, tr[1])
      table.insert(is_required, tr[2])
    end

    -- @param ipfs An IPFS instance.
    -- @param arguments Array of positional arguments.
    -- @param parameters Table of optional parameters.
    -- @param options Per-request options: `reader`, `writer`, `timeout`.
    --
    -- The default reader and writer may be disabled if given the value false.
    return function(ipfs, arguments, parameters, options)
      arguments = arguments or {}
      parameters = parameters or {}
      options = options or {}

      arguments = util.map_table(arguments_types, arguments)
      if not util.all(function(has_req, i) return has_req(arguments[i]) end, is_required) then
        return failed("Missing arguments")
      end

      parameters = util.map_table(parameters_types, parameters)

      -- If `options.reader` is truthy but not a function no reader is used.
      options.reader = options.reader or default_reader
      --options.writer = options.writer or default_writer
      return call_api_endpoint(ipfs, endpoint, arguments, parameters, options)
    end
  end


  local IPFS = require('./ipfs-endpoints')({
    Array=Array,
    Bool=Bool,
    Int=Int,
    No=No,
    String=String,
    UInt=UInt,
    Yes=Yes,
    make_ipfs_endpoint=make_ipfs_endpoint,
    reader_json=reader_json,
    reader_plain=reader_plain,
  })

  function IPFS:new(o)
    o = o or {}
    o = {
      scheme = o.scheme or 'http',
      host = o.host or "localhost",
      port = o.port or 5001,
      timeout = o.timeout,
    }
    self.__index = self
    return setmetatable(o, self)
  end

  return function(o)
    return IPFS:new(o)
  end
end
