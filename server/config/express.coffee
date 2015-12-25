path = require 'path'
express = require 'express'
# morgan = require 'morgan'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
multer = require 'multer'
# favicon = require 'favicon'
jade = require 'jade'

app = require '../server'
console.log "from express-------------", __dirname
app.engine 'jade', jade.__express

app.set 'views', path.join(__dirname, '../../views')
app.set 'view cache', true
app.set 'view engine', 'jade'
# app.use express.static(__dirname + "../../public")
app.use express.static(path.join(__dirname, "../../public"))

app.use cookieParser()
app.use bodyParser.json(limit: '10mb')
app.use bodyParser.urlencoded(extended: true, limit: '10mb')

app.all '*', (req, res, next)->
  req.set 'ni', 'liu'
  next()
