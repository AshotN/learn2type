express = require 'express'
config = require '../config'
app = require './express'
Couleurs = require('couleurs')(true);
fs = require('fs')

#http://dzone.com/snippets/array-shuffle-javascript thank you
shuffle = (o) -> #v1.0
	j = undefined
	x = undefined
	i = o.length

	while i
		j = Math.floor(Math.random() * i)
		x = o[--i]
		o[i] = o[j]
		o[j] = x
	o

app.get '/', (req, res) ->
	res.render 'index'

app.get '/getwords', (req,res) ->
	fs.readFile './server/files/words.txt', 'utf8', (err, data) ->
		return res.status(500).json err if err?
		words = data.split(' ')
		words = shuffle(words)
		return res.json words.slice(0, 250)

app.get '*', (req, res) ->
	res.render '404'

process.on "uncaughtException", (err) ->
	if err.errno is "EADDRINUSE"
		console.log("Port in use alerady".fg("#F00"))
	else
		console.log err
	return process.exit 1

