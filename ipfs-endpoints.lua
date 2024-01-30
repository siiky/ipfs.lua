return function(tbl)
  local Array = tbl.Array
  local Bool = tbl.Bool
  local Int = tbl.Int
  local No = tbl.No
  local String = tbl.String
  local UInt = tbl.UInt
  local Yes = tbl.Yes
  local make_ipfs_endpoint = tbl.make_ipfs_endpoint
  local reader_json = tbl.reader_json
  local reader_plain = tbl.reader_plain

  local IPFS = {}

  IPFS.add = make_ipfs_endpoint("add",
    reader_json,
    {},
    {
      ["silent"]=Bool,
      ["trickle"]=Bool,
      ["only-hash"]=Bool,
      ["wrap-with-directory"]=Bool,
      ["chunker"]=String,
      ["pin"]=Bool,
      ["raw-leaves"]=Bool,
      ["nocopy"]=Bool,
      ["fscache"]=Bool,
      ["cid-version"]=Int,
      ["hash"]=String,
      ["inline"]=Bool,
      ["inline-limit"]=Int,
      ["to-files"]=String,
    }
  )

  IPFS.bitswap_ledger = make_ipfs_endpoint("bitswap/ledger",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.bitswap_reprovide = make_ipfs_endpoint("bitswap/reprovide",
    reader_plain,
    {},
    {
    }
  )

  IPFS.bitswap_stat = make_ipfs_endpoint("bitswap/stat",
    reader_json,
    {},
    {
      ["verbose"]=Bool,
      ["human"]=Bool,
    }
  )

  IPFS.bitswap_wantlist = make_ipfs_endpoint("bitswap/wantlist",
    reader_json,
    {},
    {
      ["peer"]=String,
    }
  )

  IPFS.block_get = make_ipfs_endpoint("block/get",
    reader_plain,
    {{String, Yes},},
    {
    }
  )

  IPFS.block_put = make_ipfs_endpoint("block/put",
    reader_json,
    {},
    {
      ["cid-codec"]=String,
      ["mhtype"]=String,
      ["mhlen"]=Int,
      ["pin"]=Bool,
      ["allow-big-block"]=Bool,
    }
  )

  IPFS.block_rm = make_ipfs_endpoint("block/rm",
    reader_json,
    {{String, Yes},},
    {
      ["force"]=Bool,
      ["quiet"]=Bool,
    }
  )

  IPFS.block_stat = make_ipfs_endpoint("block/stat",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.bootstrap = make_ipfs_endpoint("bootstrap",
    reader_json,
    {},
    {
    }
  )

  IPFS.bootstrap_add = make_ipfs_endpoint("bootstrap/add",
    reader_json,
    {{String, No},},
    {
    }
  )

  IPFS.bootstrap_add_default = make_ipfs_endpoint("bootstrap/add/default",
    reader_json,
    {},
    {
    }
  )

  IPFS.bootstrap_list = make_ipfs_endpoint("bootstrap/list",
    reader_json,
    {},
    {
    }
  )

  IPFS.bootstrap_rm = make_ipfs_endpoint("bootstrap/rm",
    reader_json,
    {{String, No},},
    {
    }
  )

  IPFS.bootstrap_rm_all = make_ipfs_endpoint("bootstrap/rm/all",
    reader_json,
    {},
    {
    }
  )

  IPFS.cat = make_ipfs_endpoint("cat",
    reader_plain,
    {{String, Yes},},
    {
      ["offset"]=Int,
      ["length"]=Int,
    }
  )

  IPFS.cid_base32 = make_ipfs_endpoint("cid/base32",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.cid_bases = make_ipfs_endpoint("cid/bases",
    reader_json,
    {},
    {
      ["prefix"]=Bool,
      ["numeric"]=Bool,
    }
  )

  IPFS.cid_codecs = make_ipfs_endpoint("cid/codecs",
    reader_json,
    {},
    {
      ["numeric"]=Bool,
      ["supported"]=Bool,
    }
  )

  IPFS.cid_format = make_ipfs_endpoint("cid/format",
    reader_json,
    {{String, Yes},},
    {
      ["f"]=String,
      ["v"]=String,
      ["mc"]=String,
      ["b"]=String,
    }
  )

  IPFS.cid_hashes = make_ipfs_endpoint("cid/hashes",
    reader_json,
    {},
    {
      ["numeric"]=Bool,
      ["supported"]=Bool,
    }
  )

  IPFS.commands = make_ipfs_endpoint("commands",
    reader_json,
    {},
    {
      ["flags"]=Bool,
    }
  )

  IPFS.config = make_ipfs_endpoint("config",
    reader_json,
    {{String, Yes},{String, No},},
    {
      ["bool"]=Bool,
      ["json"]=Bool,
    }
  )

  IPFS.config_profile_apply = make_ipfs_endpoint("config/profile/apply",
    reader_json,
    {{String, Yes},},
    {
      ["dry-run"]=Bool,
    }
  )

  IPFS.config_replace = make_ipfs_endpoint("config/replace",
    reader_plain,
    {},
    {
    }
  )

  IPFS.config_show = make_ipfs_endpoint("config/show",
    reader_json,
    {},
    {
    }
  )

  IPFS.dag_export = make_ipfs_endpoint("dag/export",
    reader_plain,
    {{String, Yes},},
    {
    }
  )

  IPFS.dag_get = make_ipfs_endpoint("dag/get",
    reader_plain,
    {{String, Yes},},
    {
      ["output-codec"]=String,
    }
  )

  IPFS.dag_import = make_ipfs_endpoint("dag/import",
    reader_json,
    {},
    {
      ["pin-roots"]=Bool,
      ["silent"]=Bool,
      ["stats"]=Bool,
      ["allow-big-block"]=Bool,
    }
  )

  IPFS.dag_put = make_ipfs_endpoint("dag/put",
    reader_json,
    {},
    {
      ["store-codec"]=String,
      ["input-codec"]=String,
      ["pin"]=Bool,
      ["hash"]=String,
      ["allow-big-block"]=Bool,
    }
  )

  IPFS.dag_resolve = make_ipfs_endpoint("dag/resolve",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.dag_stat = make_ipfs_endpoint("dag/stat",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.dht_query = make_ipfs_endpoint("dht/query",
    reader_json,
    {{String, Yes},},
    {
      ["verbose"]=Bool,
    }
  )

  IPFS.diag_cmds = make_ipfs_endpoint("diag/cmds",
    reader_json,
    {},
    {
      ["verbose"]=Bool,
    }
  )

  IPFS.diag_cmds_clear = make_ipfs_endpoint("diag/cmds/clear",
    reader_plain,
    {},
    {
    }
  )

  IPFS.diag_cmds_set_time = make_ipfs_endpoint("diag/cmds/set-time",
    reader_plain,
    {{String, Yes},},
    {
    }
  )

  IPFS.diag_profile = make_ipfs_endpoint("diag/profile",
    reader_plain,
    {},
    {
      ["output"]=String,
      ["collectors"]=Array(String),
      ["profile-time"]=String,
      ["mutex-profile-fraction"]=Int,
      ["block-profile-rate"]=String,
    }
  )

  IPFS.diag_sys = make_ipfs_endpoint("diag/sys",
    reader_plain,
    {},
    {
    }
  )

  IPFS.files_chcid = make_ipfs_endpoint("files/chcid",
    reader_plain,
    {{String, No},},
    {
      ["cid-version"]=Int,
      ["hash"]=String,
    }
  )

  IPFS.files_cp = make_ipfs_endpoint("files/cp",
    reader_plain,
    {{String, Yes},{String, Yes},},
    {
      ["parents"]=Bool,
    }
  )

  IPFS.files_flush = make_ipfs_endpoint("files/flush",
    reader_json,
    {{String, No},},
    {
    }
  )

  IPFS.files_ls = make_ipfs_endpoint("files/ls",
    reader_json,
    {{String, No},},
    {
      ["long"]=Bool,
      ["U"]=Bool,
    }
  )

  IPFS.files_mkdir = make_ipfs_endpoint("files/mkdir",
    reader_plain,
    {{String, Yes},},
    {
      ["parents"]=Bool,
      ["cid-version"]=Int,
      ["hash"]=String,
    }
  )

  IPFS.files_mv = make_ipfs_endpoint("files/mv",
    reader_plain,
    {{String, Yes},{String, Yes},},
    {
    }
  )

  IPFS.files_read = make_ipfs_endpoint("files/read",
    reader_plain,
    {{String, Yes},},
    {
      ["offset"]=Int,
      ["count"]=Int,
    }
  )

  IPFS.files_rm = make_ipfs_endpoint("files/rm",
    reader_plain,
    {{String, Yes},},
    {
      ["recursive"]=Bool,
      ["force"]=Bool,
    }
  )

  IPFS.files_stat = make_ipfs_endpoint("files/stat",
    reader_json,
    {{String, Yes},},
    {
      ["with-local"]=Bool,
    }
  )

  IPFS.files_write = make_ipfs_endpoint("files/write",
    reader_plain,
    {{String, Yes},},
    {
      ["offset"]=Int,
      ["create"]=Bool,
      ["parents"]=Bool,
      ["truncate"]=Bool,
      ["count"]=Int,
      ["raw-leaves"]=Bool,
      ["cid-version"]=Int,
      ["hash"]=String,
    }
  )

  IPFS.filestore_dups = make_ipfs_endpoint("filestore/dups",
    reader_json,
    {},
    {
    }
  )

  IPFS.filestore_ls = make_ipfs_endpoint("filestore/ls",
    reader_json,
    {{String, No},},
    {
      ["file-order"]=Bool,
    }
  )

  IPFS.filestore_verify = make_ipfs_endpoint("filestore/verify",
    reader_json,
    {{String, No},},
    {
      ["file-order"]=Bool,
    }
  )

  IPFS.get = make_ipfs_endpoint("get",
    reader_plain,
    {{String, Yes},},
    {
      ["output"]=String,
      ["archive"]=Bool,
      ["compress"]=Bool,
      ["compression-level"]=Int,
    }
  )

  IPFS.id = make_ipfs_endpoint("id",
    reader_json,
    {{String, No},},
    {
      ["format"]=String,
      ["peerid-base"]=String,
    }
  )

  IPFS.key_gen = make_ipfs_endpoint("key/gen",
    reader_json,
    {{String, Yes},},
    {
      ["type"]=String,
      ["size"]=Int,
      ["ipns-base"]=String,
    }
  )

  IPFS.key_import = make_ipfs_endpoint("key/import",
    reader_json,
    {{String, Yes},},
    {
      ["ipns-base"]=String,
      ["format"]=String,
      ["allow-any-key-type"]=Bool,
    }
  )

  IPFS.key_list = make_ipfs_endpoint("key/list",
    reader_json,
    {},
    {
      ["l"]=Bool,
      ["ipns-base"]=String,
    }
  )

  IPFS.key_rename = make_ipfs_endpoint("key/rename",
    reader_json,
    {{String, Yes},{String, Yes},},
    {
      ["force"]=Bool,
      ["ipns-base"]=Bool,
    }
  )

  IPFS.key_rm = make_ipfs_endpoint("key/rm",
    reader_json,
    {{String, Yes},},
    {
      ["l"]=Bool,
      ["ipns-base"]=String,
    }
  )

  IPFS.key_sign = make_ipfs_endpoint("key/sign",
    reader_json,
    {},
    {
      ["key"]=String,
      ["ipns-base"]=String,
    }
  )

  IPFS.key_verify = make_ipfs_endpoint("key/verify",
    reader_json,
    {},
    {
      ["key"]=String,
      ["signature"]=String,
      ["ipns-base"]=String,
    }
  )

  IPFS.log_level = make_ipfs_endpoint("log/level",
    reader_json,
    {{String, Yes},{String, Yes},},
    {
    }
  )

  IPFS.log_ls = make_ipfs_endpoint("log/ls",
    reader_json,
    {},
    {
    }
  )

  IPFS.log_tail = make_ipfs_endpoint("log/tail",
    reader_plain,
    {},
    {
    }
  )

  IPFS.ls = make_ipfs_endpoint("ls",
    reader_json,
    {{String, Yes},},
    {
      ["resolve-type"]=Bool,
      ["size"]=Bool,
      ["stream"]=Bool,
    }
  )

  IPFS.mount = make_ipfs_endpoint("mount",
    reader_json,
    {},
    {
      ["ipfs-path"]=String,
      ["ipns-path"]=String,
    }
  )

  IPFS.multibase_decode = make_ipfs_endpoint("multibase/decode",
    reader_plain,
    {},
    {
    }
  )

  IPFS.multibase_encode = make_ipfs_endpoint("multibase/encode",
    reader_plain,
    {},
    {
      ["b"]=String,
    }
  )

  IPFS.multibase_list = make_ipfs_endpoint("multibase/list",
    reader_json,
    {},
    {
      ["prefix"]=Bool,
      ["numeric"]=Bool,
    }
  )

  IPFS.multibase_transcode = make_ipfs_endpoint("multibase/transcode",
    reader_plain,
    {},
    {
      ["b"]=String,
    }
  )

  IPFS.name_inspect = make_ipfs_endpoint("name/inspect",
    reader_json,
    {},
    {
      ["verify"]=String,
      ["dump"]=Bool,
    }
  )

  IPFS.name_publish = make_ipfs_endpoint("name/publish",
    reader_json,
    {{String, Yes},},
    {
      ["resolve"]=Bool,
      ["lifetime"]=String,
      ["allow-offline"]=Bool,
      ["ttl"]=String,
      ["key"]=String,
      ["quieter"]=Bool,
      ["v1compat"]=Bool,
      ["ipns-base"]=String,
    }
  )

  IPFS.name_pubsub_cancel = make_ipfs_endpoint("name/pubsub/cancel",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.name_pubsub_state = make_ipfs_endpoint("name/pubsub/state",
    reader_json,
    {},
    {
    }
  )

  IPFS.name_pubsub_subs = make_ipfs_endpoint("name/pubsub/subs",
    reader_json,
    {},
    {
      ["ipns-base"]=String,
    }
  )

  IPFS.name_resolve = make_ipfs_endpoint("name/resolve",
    reader_json,
    {{String, No},},
    {
      ["recursive"]=Bool,
      ["nocache"]=Bool,
      ["dht-record-count"]=UInt,
      ["dht-timeout"]=String,
      ["stream"]=Bool,
    }
  )

  IPFS.p2p_close = make_ipfs_endpoint("p2p/close",
    reader_json,
    {},
    {
      ["all"]=Bool,
      ["protocol"]=String,
      ["listen-address"]=String,
      ["target-address"]=String,
    }
  )

  IPFS.p2p_forward = make_ipfs_endpoint("p2p/forward",
    reader_plain,
    {{String, Yes},{String, Yes},{String, Yes},},
    {
      ["allow-custom-protocol"]=Bool,
    }
  )

  IPFS.p2p_listen = make_ipfs_endpoint("p2p/listen",
    reader_plain,
    {{String, Yes},{String, Yes},},
    {
      ["allow-custom-protocol"]=Bool,
      ["report-peer-id"]=Bool,
    }
  )

  IPFS.p2p_ls = make_ipfs_endpoint("p2p/ls",
    reader_json,
    {},
    {
      ["headers"]=Bool,
    }
  )

  IPFS.p2p_stream_close = make_ipfs_endpoint("p2p/stream/close",
    reader_plain,
    {{String, No},},
    {
      ["all"]=Bool,
    }
  )

  IPFS.p2p_stream_ls = make_ipfs_endpoint("p2p/stream/ls",
    reader_json,
    {},
    {
      ["headers"]=Bool,
    }
  )

  IPFS.pin_add = make_ipfs_endpoint("pin/add",
    reader_json,
    {{String, Yes},},
    {
      ["recursive"]=Bool,
      ["name"]=String,
    }
  )

  IPFS.pin_ls = make_ipfs_endpoint("pin/ls",
    reader_json,
    {{String, No},},
    {
      ["type"]=String,
      ["quiet"]=Bool,
      ["stream"]=Bool,
      ["names"]=Bool,
    }
  )

  IPFS.pin_rm = make_ipfs_endpoint("pin/rm",
    reader_json,
    {{String, Yes},},
    {
      ["recursive"]=Bool,
    }
  )

  IPFS.pin_update = make_ipfs_endpoint("pin/update",
    reader_json,
    {{String, Yes},{String, Yes},},
    {
      ["unpin"]=Bool,
    }
  )

  IPFS.pin_verify = make_ipfs_endpoint("pin/verify",
    reader_json,
    {},
    {
      ["verbose"]=Bool,
      ["quiet"]=Bool,
    }
  )

  IPFS.pin_remote_add = make_ipfs_endpoint("pin/remote/add",
    reader_json,
    {{String, Yes},},
    {
      ["service"]=String,
      ["name"]=String,
      ["background"]=Bool,
    }
  )

  IPFS.pin_remote_ls = make_ipfs_endpoint("pin/remote/ls",
    reader_json,
    {},
    {
      ["service"]=String,
      ["name"]=String,
      ["cid"]=Array(String),
      ["status"]=Array(String),
    }
  )

  IPFS.pin_remote_rm = make_ipfs_endpoint("pin/remote/rm",
    reader_plain,
    {},
    {
      ["service"]=String,
      ["name"]=String,
      ["cid"]=Array(String),
      ["status"]=Array(String),
      ["force"]=Bool,
    }
  )

  IPFS.pin_remote_service_add = make_ipfs_endpoint("pin/remote/service/add",
    reader_plain,
    {{String, Yes},{String, Yes},{String, Yes},},
    {
    }
  )

  IPFS.pin_remote_service_ls = make_ipfs_endpoint("pin/remote/service/ls",
    reader_json,
    {},
    {
      ["stat"]=Bool,
    }
  )

  IPFS.pin_remote_service_rm = make_ipfs_endpoint("pin/remote/service/rm",
    reader_plain,
    {{String, Yes},},
    {
    }
  )

  IPFS.ping = make_ipfs_endpoint("ping",
    reader_json,
    {{String, Yes},},
    {
      ["count"]=Int,
    }
  )

  IPFS.refs = make_ipfs_endpoint("refs",
    reader_json,
    {{String, Yes},},
    {
      ["format"]=String,
      ["edges"]=Bool,
      ["unique"]=Bool,
      ["recursive"]=Bool,
      ["max-depth"]=Int,
    }
  )

  IPFS.refs_local = make_ipfs_endpoint("refs/local",
    reader_json,
    {},
    {
    }
  )

  IPFS.repo_gc = make_ipfs_endpoint("repo/gc",
    reader_json,
    {},
    {
      ["stream-errors"]=Bool,
      ["quiet"]=Bool,
    }
  )

  IPFS.repo_ls = make_ipfs_endpoint("repo/ls",
    reader_json,
    {},
    {
    }
  )

  IPFS.repo_stat = make_ipfs_endpoint("repo/stat",
    reader_json,
    {},
    {
      ["size-only"]=Bool,
      ["human"]=Bool,
    }
  )

  IPFS.repo_verify = make_ipfs_endpoint("repo/verify",
    reader_json,
    {},
    {
    }
  )

  IPFS.repo_version = make_ipfs_endpoint("repo/version",
    reader_json,
    {},
    {
      ["quiet"]=Bool,
    }
  )

  IPFS.resolve = make_ipfs_endpoint("resolve",
    reader_json,
    {{String, Yes},},
    {
      ["recursive"]=Bool,
      ["dht-record-count"]=Int,
      ["dht-timeout"]=String,
    }
  )

  IPFS.routing_findpeer = make_ipfs_endpoint("routing/findpeer",
    reader_json,
    {{String, Yes},},
    {
      ["verbose"]=Bool,
    }
  )

  IPFS.routing_findprovs = make_ipfs_endpoint("routing/findprovs",
    reader_json,
    {{String, Yes},},
    {
      ["verbose"]=Bool,
      ["num-providers"]=Int,
    }
  )

  IPFS.routing_get = make_ipfs_endpoint("routing/get",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.routing_provide = make_ipfs_endpoint("routing/provide",
    reader_json,
    {{String, Yes},},
    {
      ["verbose"]=Bool,
      ["recursive"]=Bool,
    }
  )

  IPFS.routing_put = make_ipfs_endpoint("routing/put",
    reader_json,
    {{String, Yes},},
    {
      ["allow-offline"]=Bool,
    }
  )

  IPFS.shutdown = make_ipfs_endpoint("shutdown",
    reader_plain,
    {},
    {
    }
  )

  IPFS.stats_bitswap = make_ipfs_endpoint("stats/bitswap",
    reader_json,
    {},
    {
      ["verbose"]=Bool,
      ["human"]=Bool,
    }
  )

  IPFS.stats_bw = make_ipfs_endpoint("stats/bw",
    reader_json,
    {},
    {
      ["peer"]=String,
      ["proto"]=String,
      ["poll"]=Bool,
      ["interval"]=String,
    }
  )

  IPFS.stats_dht = make_ipfs_endpoint("stats/dht",
    reader_json,
    {{String, No},},
    {
    }
  )

  IPFS.stats_provide = make_ipfs_endpoint("stats/provide",
    reader_json,
    {},
    {
    }
  )

  IPFS.stats_repo = make_ipfs_endpoint("stats/repo",
    reader_json,
    {},
    {
      ["size-only"]=Bool,
      ["human"]=Bool,
    }
  )

  IPFS.swarm_addrs = make_ipfs_endpoint("swarm/addrs",
    reader_json,
    {},
    {
    }
  )

  IPFS.swarm_addrs_listen = make_ipfs_endpoint("swarm/addrs/listen",
    reader_json,
    {},
    {
    }
  )

  IPFS.swarm_addrs_local = make_ipfs_endpoint("swarm/addrs/local",
    reader_json,
    {},
    {
      ["id"]=Bool,
    }
  )

  IPFS.swarm_connect = make_ipfs_endpoint("swarm/connect",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.swarm_disconnect = make_ipfs_endpoint("swarm/disconnect",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.swarm_filters = make_ipfs_endpoint("swarm/filters",
    reader_json,
    {},
    {
    }
  )

  IPFS.swarm_filters_add = make_ipfs_endpoint("swarm/filters/add",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.swarm_filters_rm = make_ipfs_endpoint("swarm/filters/rm",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.swarm_peering_add = make_ipfs_endpoint("swarm/peering/add",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.swarm_peering_ls = make_ipfs_endpoint("swarm/peering/ls",
    reader_json,
    {},
    {
    }
  )

  IPFS.swarm_peering_rm = make_ipfs_endpoint("swarm/peering/rm",
    reader_json,
    {{String, Yes},},
    {
    }
  )

  IPFS.swarm_peers = make_ipfs_endpoint("swarm/peers",
    reader_json,
    {},
    {
      ["verbose"]=Bool,
      ["streams"]=Bool,
      ["latency"]=Bool,
      ["direction"]=Bool,
      ["identify"]=Bool,
    }
  )

  IPFS.swarm_resources = make_ipfs_endpoint("swarm/resources",
    reader_json,
    {},
    {
    }
  )

  IPFS.version = make_ipfs_endpoint("version",
    reader_json,
    {},
    {
      ["number"]=Bool,
      ["commit"]=Bool,
      ["repo"]=Bool,
      ["all"]=Bool,
    }
  )

  IPFS.version_deps = make_ipfs_endpoint("version/deps",
    reader_json,
    {},
    {
    }
  )

  return IPFS
end
