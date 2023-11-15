package = "ipfs"
version = "0.0.14-1"
source = {
   url = "https://git.sr.ht/~siiky/ipfs.lua",
   tag = "0.0.14"
}
description = {
   summary = "IPFS HTTP API for Lua",
   homepage = "https://git.sr.ht/~siiky/ipfs.lua",
   license = "unlicense"
}
dependencies = {
   "lua ~> 5.4",
   "http ~> 0.4"
}
build = {
   type = "builtin",
   modules = {
      ["ipfs"] = "ipfs.lua",
      ["ipfs-endpoints"] = "ipfs-endpoints.lua",
      ["http"] = "http.lua",
      ["util"] = "util.lua"
   }
}
