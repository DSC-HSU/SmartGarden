import 'dart:ffi';

// import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void  main() async{
  // IO.Socket socket = IO.io('http://35.213.149.38:8000', <String, dynamic>{
    IO.Socket socket = IO.io('http://127.0.0.1:8000', <String, dynamic>{
    'transports': ['websocket'],
  });
  socket.id="duybeo";
  socket.on('connect', (mesg)=>{
    print(mesg)
  });
    socket.on("duy", (handler)=>{
    print(handler)
  });
      socket.on("duybeo", (handler)=>{
    print(handler)
  });
    socket.emit("love",{
    'aaa':1111,
    "2222":2222,
  });

  // Future<Void> aaa(){
    
  //   return "AAAA";
  // }
}
  // socket.on("duy", (handler)=>{
  //   print(handler)
  // });
//   socket.on("duybeo", (handler)=>{
//     print(handler)
//   });
//   socket.emit("love",{
//     'aaa':1111,
//     "2222":2222,
//   });
// }

// class socket_IO{
  
  

  
  // IO.Socket socket = IO.io('http://localhost:3000', <String, dynamic>{
  //   'transports': ['websocket'],
  // });
  //  ;

  


  
  
  
  
  

// }