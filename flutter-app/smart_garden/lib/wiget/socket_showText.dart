import 'dart:io';
import 'package:smart_garden/wiget/socket.dart' as socket;
import 'package:flutter/material.dart';
// import 'package:socket_io/socket_io.dart';

class streamshowTextWithOption extends StatelessWidget {
  
  
  

  @override
  Widget build(BuildContext context) {
    // double spacing = 30;
    // bool overflowVaule_dectector = false;
    // if (this.vaule.length >= 3) {
    //   overflowVaule_dectector = true;
    // }

    // TODO: implement build
  //   return StreamBuilder<Event>(
  //             // stream: callbackonchange.asBroadcastStream(),
  //             stream: 
  //             builder: (context, snap) {
  //               if (snap.connectionState==ConnectionState.active) {
  //                 print(snap.data);
  //                 print(snap.data.snapshot.value);
  //                 return Container(
  //                   width: 50,
  //                   height: 50,
  //                   color: Colors.yellow,
  //                   child: Text(snap.data.snapshot.value.toString(),textAlign: TextAlign.center,),
  //                 );
  //               } else {
  //                 print('notworking');
  //                 print(snap.data.toString());
  //                 return Text("No data");
  //               }
  //             },
  //           );



  // }
  return Container(child: Text("data"));

  
  }
}