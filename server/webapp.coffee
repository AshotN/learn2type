express = require 'express'
config = require '../config'
app = require './express'
Couleurs = require('couleurs')(true);


app.get '/', (req, res) ->
  res.render 'index'

app.get '*', (req, res) ->
  res.render '404'

process.on "uncaughtException", (err) ->
  if err.errno is "EADDRINUSE"
    console.log("Port in use already".fg("#F00"))
  else
    console.log err
  return process.exit 1

