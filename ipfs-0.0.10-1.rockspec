package = "ipfs"
version = "0.0.10-1"
source = {
   url = "https://git.sr.ht/~siiky/ipfs.lua",
   tag = "0.0.10"
}
description = {
   summary = "IPFS HTTP API for Lua",
   homepage = "https://git.sr.ht/~siiky/ipfs.lua",
   license = "unlicense"
}
dependencies = {
   "lua ~> 5.4"
}
build = {
   type = "builtin",
   modules = {
      ipfs = "ipfs.lua"
   }
}
