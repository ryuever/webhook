# app = require './server/server'
# logger = require 'graceful-logger'
# crypto = require 'crypto'
# port = process.env.PORT or 3000
# uuid = require 'uuid'

# http = require('http').Server(app)
# io = require('socket.io')(http);

# _hashId = -> crypto.createHash('sha1').update(uuid.v4() + Date.now()).digest('hex')

# module.exports = io
# io.on 'connection',(socket)->
#   socket.on 'first connect', (msg)->
#     console.log "message --------", msg, _hashId()
#     room = _hashId().toString()
#     socket.join(room);
#     io.in(room).emit('hashid', room)
#     # socket.broadcast.to(room).emit('hashid', room);

# http.listen port, -> logger.info "Server listen on #{port}"




H = require './server/socketio'
logger = require 'graceful-logger'

port = process.env.PORT or 3000

H.http.listen port, -> logger.info "Server listen on #{port}"
