import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class socketIO_Handler with ChangeNotifier {
  IO.Socket socket;
  String temp;
  String hum;
  int pumpState;
  bool clientState;
  void main() {
    //  IO.Socket socket = IO.io('http://35.213.149.38:8000', <String, dynamic>{
    this.socket = IO.io('http://192.168.31.165:8000', <String, dynamic>{
      'transports': ['websocket'],
    });
    this.socket.on("connect", (_) => print('Connected'));
    socket.on(
        "iot-flutter-demo",
        (handler) => {
              this.clientState = true,
              this.temp = handler['temp'].toString(),
              this.hum = handler['hum'].toString(),
              this.pumpState = handler['pump'],
              notifyListeners()
            });
    socket.on(
        'disconnect', (_) => {this.clientState = false, notifyListeners()});
  }

  socketIO_Handler() {
    main();
  }
}
