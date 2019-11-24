const socket = require('socket.io-client')('http://35.213.149.38:8000');
// const socket = require('socket.io-client')('http://127.0.0.1:8000');

socket.io.autoConnect=true
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

function EmitData(chanel,data){
    socket.emit(chanel,data)
}

module.exports={
    EmitData
}
