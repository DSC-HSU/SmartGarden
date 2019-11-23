const app = require('express')();
const server = require('http').createServer(app);
const io = require('socket.io')(server);


app.get('/{Name}',(req,res)=>{
    res.send('<h1>Hello</h1>' + Name)
})
// app.listen(3000,()=>{
//     console.log('[*] Server running on port 3000')
// })
io.on('connect', () => { console.log("ok") });
server.listen(3000);
server.on("connection",(connect)=>{
    console.log(connect.remoteAddress)
})
