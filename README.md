# ipfs.lua

**Lua library for the [IPFS] [HTTP API].**

Endpoint definitions (`ipfs-enpoints.lua`) are generated with
`export-to-lua.scm` from [`ipfs.scm`].

---

Most of the requirements for [`ipfs.scm`] also apply here. You must be familiar
with the IPFS HTTP API if you want to use this library. It tries to catch some
bad usage but it's not very strict.

Each exported procedure represents one endpoint -- see the note on [`ipfs.scm`]
about missing endpoints. In general, `/api/v0/some/endpoint` will be used as
`ipfs:some_endpoint` -- more specifically, `[-/]` are replaced with `_` to make
the endpoint name a valid Lua identifier. For example, `id` is called `id`,
`bootstrap/list` is called `bootstrap_list`, and `diag/cmds/set-time` is called
`diag_cmds_set_time`.

The `reader`, `writer`, and `timeout` may all be overwritten on a per-call
basis.

## Usage

```lua
-- There are some "module parameters":
local IPFS = require('ipfs')({
  -- Both readers are optional. If not given, none will be used and you must
  -- manually "read" the HTTP stream.
  reader_json=...,
  reader_plain=...,
})

-- And "instance parameters":
local ipfs = IPFS({
  -- The connection details and their defaults:
  scheme='http',
  host="localhost",
  port=5001,

  -- Optionally (see the http rock):
  timeout=...,
})

-- OR:

--[[
local ipfs = require('ipfs')({
  reader_json=...,
  reader_plain=...,
})({
  scheme='http',
  host="localhost",
  port=5001,
  timeout=...,
})
--]]

-- No arguments, parameters, nor options given. Calls the `/api/v0/id`
-- endpoint with the default reader, writer, and timeout.
ipfs:id()

-- The recognized options are `reader`, `writer`, and `timeout`.
ipfs:id(nil, {}, {reader=..., writer=..., timeout=...})

-- The reader may be skipped on a per-call basis if given and truthy but not a
-- procedure.
ipfs:id({}, nil, {reader=true})

-- Unexpected arguments/parameters, i.e., arguments/parameters that are no
-- specified in the endpoint's definition, are ignored.
ipfs:id({1, 2, 3}, {another="thing"})
```

Also check out `example.scm`.

[HTTP API]: https://docs.ipfs.io/reference/http/api
[IPFS]: https://ipfs.io
[`ipfs.scm`]: https://github.com/siiky/ipfs.scm
