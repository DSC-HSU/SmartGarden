/*#use socket.io is a bridge ras voi server
  #connection cua ras voi server la thannh log roi truyen len firebase
  #*/
// var FirebaseInitializeApp=admin.initializeApp({
//     credential:admin.credential.cert(serviceAccount),
//     databaseURL:"https://iot-thcntt1.firebaseio.com"
// });
//create a http server 
// const Firebase = require('firebase')("https://iot-thcntt1.firebaseio.com")


const app = require('express')();  
const server =  require('http').Server(app); 
//add socket io to the server 
const io = require('socket.io')(server);
server.listen(8000,'127.0.0.1',()=>{
  console.log("[*] Server is running at http://127.0.0.1:8000")
}); //listen for connection 

//How to know what should send data to the server
//Restful api


//RasPi need to talk to the server on port 8000 
//First build the handler for the incoming connection for the RasPi


//Handle the information send to server from RasPi 
io.on('connection',(socket)=>{ //when RasPi connected to port 8000 
  console.log('Rasberry Pi [Connected]',socket.id)
  //io.sockets.emit: send to all connected client
  
  socket.on('sendDataToTheServer',(data) => {
    io.sockets.emit('serverDataReceived',{Server:'Data Received!'})
    console.log('Data sent: ' + JSON.stringify(data)+ ' by ' + '['+socket.id +']') 
    
  });


  //Sending log to the firebase, listen to the sendDataToServer 
  //and then use that data and send it to firebase
  // socket.on('sendDataToTheSever',(firebaseLogData)=>{
  //   //send only to the firebase that connect to the server
  //   //Will use the data
  //   Firebase.on("value", ()=>{
  //     io.Firebase.emit('')
  //   })
  // })

  //indicate the ras has been disconnected from the server 
  socket.on('disconnect',(data)=>{
    console.log('Rasberry Pi ' + '['+socket.id+'] '+'[Disconnected]' )
  });            
});



//Send the data to the firebase and the clientPhone
//Logging all the traffic between RasPi and the Server
