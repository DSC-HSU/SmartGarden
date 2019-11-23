
const socket = require('socket.io-client')('http://127.0.0.1:8000')

setInterval(()=>{
    socket.emit('DataToServer',{ 'dataPayLoad':'Testing information',})
},3000)








