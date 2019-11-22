/*#use socket.io is a bridge ras voi server
  #connection cua ras voi server la thannh log roi truyen len firebase
  #*/

const app = require('express')();
const server =  require('http').Server(app);
const io = require('socket.io')(server);

server.listen(80);

app.get('/',(req,res)=>{
  
});

//RasPi need to talk to the server on port 80 

//First build the handler for the incoming connection for the RasPi










io.on('connection',(socket)=>{ //when RasPi connected to port 80 
  console.log("RasPi has connected")
  socket.emit('testConnection', {description: 'Hi! RasPi has connected to the server'}); 
  socket.on('RasPiRequest', (data, msg)=>{
    
  });  
});


io.sockets.on('connection',(socket)=>{
  socket.emit('sendRasPiDataToFireBase',{})
})





