path = require 'path'
Err = require 'err1st'

app = require '../server'

# https://jianliao.com/v2/services/webhook/077e0e6d0f6da87658a8308a4a7c81e885561446
app.post '/webhook/:hashId', to: "webhook#display"
app.get '/test/', to: "webhook#test"
app.get '/', to: 'webhook#index'
