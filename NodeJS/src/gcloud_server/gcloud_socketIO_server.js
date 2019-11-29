var firebaseConnection = require('../firebaseQuery.js')
var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
 res.send('<h1>Hello</h1>')
});

http.listen(8000,"0.0.0.0", function(){
    console.log('listening on *:8000');
  });

io.on('connection', function(socket){
  console.log('a user connected :' + socket.id);
  console.log(socket.nsp.name)
    socket.on('iot-flutter-demo',(data)=>{
        firebaseConnection.autoPush(data,'iot-flutter-demo')
        console.log(data)
        io.sockets.emit('iot-flutter-demo',data)
    })
});
var counter = 1
function Emitdata(){
    
    io.sockets.emit('duybeo',{
        'love':"ya 3000 :" + counter++,
        'form':'khuong the guys with a Dicect Action bag'
    });
    io.sockets.emit('duy',{
        'love':"ya",
        'form':'khuong the guys with a hacker'
    });
    io.sockets.emit('test-chancel',{
        'hum':counter++,
        'temp':counter++
    })
}

setInterval(()=>{
    Emitdata()
},1000)


