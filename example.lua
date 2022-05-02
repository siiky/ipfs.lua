local json = require('lunajson') -- https://luarocks.org/modules/grafi/lunajson

local reader_json = json.decode
function reader_plain(str)
  return str
end

local IPFS = require('./ipfs')({
  reader_json=reader_json,
  reader_plain=reader_plain,
})

local ipfs = IPFS({
  scheme = 'http',
  host = "localhost",
  port = 5001,
})
-- or
--local ipfs = require('./ipfs')({...})({...})

--print(ipfs.bootstrap)
--print(ipfs.bootstrap.add)
--print(ipfs.bootstrap.list)
--print(ipfs:bootstrap:list(ipfs))
--print(ipfs:bootstrap_list(
--  {},
--  {},
--  {}
--))
print(ipfs:id({}, {}, {reader=reader_plain}))
