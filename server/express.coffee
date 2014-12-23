path = require 'path'
express = require 'express'

config = require '../config'


app = express()
app.disable 'x-powered-by'

app.use express.static path.resolve __dirname, '../client'
app.set 'views', path.resolve __dirname, '../views'
app.set 'view engine', 'jade'

#console.log 5, sessionStore.db
module.exports = app





