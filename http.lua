return {
  bit = require('http.bit'),
  client = require('http.client'),
  cookie = require('http.cookie'),
  h1 = {
    connection = require('http.h1_connection'),
    reason_phrases = require('http.h1_reason_phrases'),
    stream = require('http.h1_stream'),
  },
  h2 = {
    connection = require('http.h2_connection'),
    error = require('http.h2_error'),
    stream = require('http.h2_stream'),
  },
  headers = require('http.headers'),
  hpack = require('http.hpack'),
  hsts = require('http.hsts'),
  proxies = require('http.proxies'),
  request = require('http.request'),
  server = require('http.server'),
  socks = require('http.socks'),
  tls = require('http.tls'),
  util = require('http.util'),
  version = require('http.version'),
  websocket = require('http.websocket'),
  --zlib = require('http.zlib'),
}
