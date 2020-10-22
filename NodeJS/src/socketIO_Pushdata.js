const socket = require('socket.io-client');

// const socketClient = socket.connect('http://34.80.236.168:8000')
const socketClient = socket.connect('http://127.0.0.1:8000')


// const socket = require('socket.io-client')('http://127.0.0.1:8000');

socketClient.io.autoConnect = true
var counter = 0
// import io from 'socket.io-client';
// const socket = require('socket.io-client')
// const socket = io('http://35.213.149.38:8000')

// function EmitData(chanel,JSONData){
//     socket.emit(chanel,JSONData)
// }
// socket.on('duybeo',(data)=>{
//     console.log(data)
// })
// socket.on('duy',(data)=>{
//     console.log(data)
// })
// socket.nsp='/duy'
// socket.on('duybeo',(data)=>
// {
//     console.log(data);
//     // socket.emit('duy123',"hello")
// })


// setInterval(()=>{
//     socket.emit('duy123',{
//         'hi': "form Raspberry Pi" + counter++
//     })
// },2000)

function EmitData(chanel, data) {
    socketClient.emit(chanel, data)
}

function onPumpRequest(callback) {
    socketClient.on("iot-flutter-demo-phone-to-garden", (data) => {
        let dataJSON = JSON.parse(data);
        callback(dataJSON.tooglePump);
    })
}

module.exports = {
    EmitData, onPumpRequest
}
