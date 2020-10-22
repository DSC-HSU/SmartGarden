var firebaseConnection = require('../firebaseQuery.js')
var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

app.get('/', function (req, res) {
    res.send('<h1>Hello</h1>')
});

http.listen(8000, "0.0.0.0", function () {
    console.log('listening on *:8000');
});

io.on('connection', function (socket) {
    console.log('a user connected :' + socket.id);
    console.log(socket.nsp.name)
    socket.on('iot-flutter-demo', (data) => {
        // firebaseConnection.autoPush(data, socket.id)
        console.log(data)
        io.sockets.emit('iot-flutter-demo', data)
    })

    socket.on("iot-flutter-demo-phone-to-garden", (data) => {
        io.sockets.emit("iot-flutter-demo-phone-to-garden", data);
    })
});