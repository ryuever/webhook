console.log "hhhhhlllllllllllllllll"

express = require 'express'
sundae = require 'sundae'
requireDir = require 'require-dir'
sundae = require 'sundae'
express_app = express()

module.exports = app = sundae express_app


console.log "hhhhhlllllllllllllllll"
# module.exports = require('http').Server(app);

requireDir './controllers', recurse: true
console.log "hhhhhlllllllllllllllll"

require './config/express'
require './config/request'
require './config/routes'
