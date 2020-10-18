
const socket  = require('socket.io-client')('http://127.0.0.1:8000')


socket.on('connect',()=>{
    console.log('connected')
    socket.emit('PhoneRoomJoin', 'Phone has join the Room')
})



socket.on('serverDataToPhoneClient',(dataServer)=>{
    console.log(dataServer);
    
})

