app = require "../server"
H = require "../socketio"

bodyParser = require 'body-parser'
app.use bodyParser.json(limit: '10mb')
app.use bodyParser.urlencoded(extended: true, limit: '10mb')

module.exports = webhookController = app.controller 'webhook', ->

  @action 'test', (req, res, callback) ->
    res.status(200).json "first": 'hello'

  @action 'display', (req, res, callback) ->
    console.log "hashId------------", req.get('hashId')
    room = req.get('hashId')
    # test = {"a": "hello", "c": {"b": "world"}}
    # test = {a:1, 'b':'foo', c:[false,'false',null, 'null', {d:{e:1.3e5,f:'1.3e5'}}]}
    # H.io.in(room).emit("message", JSON.stringify req.body, null, 4)
    console.log "req.body ------------", req.body
    H.io.in(room).emit("message", JSON.stringify req.body, null, 2)
    res.status(200).end()
    # res.render 'integration', 'content': JSON.stringify req.body, null, 2

  @action 'index', (req, res, callback) ->
    res.render 'index', 'title' : 'Hello - Please Login To Your Account'
