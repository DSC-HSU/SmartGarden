import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_garden/wiget/socket.dart' as socket;
import 'package:flutter/material.dart';
// import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class streamshowTextWithOption extends StatelessWidget {
  
  List<Object> data;
  IO.Socket socket ;
  // var data;
  @override
  void initState(){
  //   socket== IO.io('http://127.0.0.1:8000', <String, dynamic>{
  //   'transports': ['websocket'],
  // });
  //   socket.on("duybeo", (data)=>{
  //     print(data)
  //   });
  }

  // Stream<Object> aloha(Object data){
  //   return data;
  // }
  

  @override
  Widget build(BuildContext context) {
    // double spacing = 30;
    // bool overflowVaule_dectector = false;
    // if (this.vaule.length >= 3) {
    //   overflowVaule_dectector = true;
    // }

    // TODO: implement build
    // return StreamBuilder<Event>(
    //           // stream: callbackonchange.asBroadcastStream(),
    //           stream: aloha()
    //           builder: (context, snap) {
    //             if (snap.connectionState==ConnectionState.active) {
    //               print(snap.data);
    //               print(snap.data.snapshot.value);
    //               return Container(
    //                 width: 50,
    //                 height: 50,
    //                 color: Colors.yellow,
    //                 child: Text(snap.data.snapshot.value.toString(),textAlign: TextAlign.center,),
    //               );
    //             } else {
    //               print('notworking');
    //               print(snap.data.toString());
    //               return Text("No data");
    //             }
    //           },
    //         );



  // }
  // return Container(child: Text("data"));
  // return FutureBuilder(
  //   builder: (context,){

  //   },
  // );

  
  }
  void getdata() async{
    socket.on("event", (handler)=>{
      
      }
    );
  }
}