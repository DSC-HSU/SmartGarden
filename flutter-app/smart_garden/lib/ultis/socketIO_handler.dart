import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class socketIO_Handler with ChangeNotifier {
  IO.Socket socket;
  String temp;
  String hum;
  int pumpState;
  bool clientState;
  bool tooglePump;

  int soildhum;
  void main() {
    tooglePump = false;
    // this.socket = IO.io('http://34.80.236.168:8000', <String, dynamic>{
    this.socket = IO.io('http://192.168.1.11:8000', <String, dynamic>{
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
              this.soildhum = handler['soildhum'],
              notifyListeners()
            });
    socket.on(
        'disconnect', (_) => {this.clientState = false, notifyListeners()});

    socket.on('iot-flutter-demo-phone-to-garden', (data) => {print(data)});
  }

  emitRequestPump() {
    tooglePump = !tooglePump;
    socket.emit('iot-flutter-demo-phone-to-garden',
        jsonEncode({"tooglePump": tooglePump}));
  }

  socketIO_Handler() {
    main();
  }
}
