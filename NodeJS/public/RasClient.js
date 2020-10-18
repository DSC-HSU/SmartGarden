
const socket = require('socket.io-client')('http://127.0.0.1:8000')
//Testing
//setInterval(()=>{
//    socket.emit('DataToServer',{ 'dataPayLoad':'Testing information',})
//},3000)

//The core information will be the Json that the RasPi will send
//
// 
//Event: connect = event connection urgh no its not 

//
socket.on('connect',()=>{ //on connect send this data to the server
    // socket.join(RasOnly)
    console.log("Client connected: " + socket.connected) //to know whether it connected or not   
    setInterval(()=>{
      socket.emit('sendDataToTheServer',{
        "counter" : 34,
        "user" : {
          "Duybeo" : {
            "hum" : 70,
            "pump" : true,
            "temp" : 25.8
          },
          "id" : {
            "sensor" : {
              "hum" : 11,
              "lux" : 300,
              "pump" : 1,
              "temp" : 22
            }
          }
        }
      })
      console.log("I have send data")
    },3000) 
})

//Duy, you should modify the data 

//Print the data that the server broadcast back for testing

//just log out for nothing
socket.on('serverDataReceived',(data)=>{
  console.log(data)
})
