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
  console.log('a user connected' + socket.id);
  console.log(socket.nsp.name)
//   socket.broadcast.emit("hi there")
//   console.log(socket.id)
    socket.on('duy123',(data)=>{
        console.log(data)
    })
});

// io.on('duy123',(data)=>{
//     console.log(data)
// })

// io.sockets.on('duy123',(data)=>{
//     console.log(data)
// })

io.sockets.on('love',(data)=>{
    console.log(data)
})

// io.sockets.on()

io.on('duychicken',(data)=>{
    console.log(data)
})


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
}

setInterval(()=>{
    Emitdata()
},2000)


