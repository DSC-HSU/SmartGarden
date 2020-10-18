import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/src/socket.dart';

class socketIO_Handler with ChangeNotifier {
  String temp;
  String hum;
  int pumpState;
  bool clientState;
  void main(){
     IO.Socket socket = IO.io('http://35.213.149.38:8000', <String, dynamic>{
    // IO.Socket socket = IO.io('http://127.0.0.1:8000', <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.on(
        "iot-flutter-demo",
        (handler) => {
              this.clientState = true,
              this.temp = handler['temp'].toString(),
              this.hum = handler['hum'].toString(),
              this.pumpState = handler['pump'],
              notifyListeners()
            });
    socket.on('disconnect', (_) => {
      this.clientState = false,
      notifyListeners()
      });
  }



  socketIO_Handler() {
    main();
  }
}
