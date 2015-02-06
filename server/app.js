
/**
 * Module dependencies.
 */

var express = require('express'),
    app = express(),
    methodOverride = require('method-override');
// Configuration
app.use(express.static(__dirname + '/../client/dist'));

// Start server
var server = require('http').createServer(app);
var io = require('socket.io').listen(server);
var socket = require('./routes/socket');
// Socket.io Communication

io.sockets.on('connection', socket);

server.listen(8000);
