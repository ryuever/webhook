app = require './server'

crypto = require 'crypto'
uuid = require 'uuid'

hp = require('http').Server(app)
exports.http = hp
io = require('socket.io')(hp)
exports.io = io

_hashId = -> crypto.createHash('sha1').update(uuid.v4() + Date.now()).digest('hex')

io.on 'connection',(socket)->
  socket.on 'first connect', (msg)->
    room = _hashId().toString()
    socket.join(room);
    io.in(room).emit('hashid', room)
    # socket.broadcast.to(room).emit('hashid', room);
