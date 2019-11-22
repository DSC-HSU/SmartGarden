/*#use socket.io is a bridge ras voi server
  #connection cua ras voi server la thannh log roi truyen len firebase
  #*/

//create a http server 
const app = require('express')();  
const server =  require('http').Server(app); 
//add socket io to the server 
const io = require('socket.io')(server);

server.listen(8000,'127.0.0.1'); //listen for connection 


//Restful api
app.get('/',(req,res)=>{
  res.send("<h1>Hello you fucking piece of shit</h1>") 
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





