import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:smart_garden/wiget/socket.dart' as socket;
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:smart_garden/ultis/socketIO_handler.dart';

class socketIO_Controller extends StatelessWidget {
  final String specialChar;
  final String notation;
  final String title;
  // final String db_Path;

  socketIO_Controller(this.title, this.notation, this.specialChar);
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (_) => socketIO_Handler(),
        child: socketIO_showtext(this.title, this.notation, this.specialChar));
  }
}

class socketIO_showtext extends StatefulWidget {
  final String title;
  final String specialChar;
  final String notation;
  socketIO_showtext(this.title, this.notation, this.specialChar) {}

  @override
  _socketIO_showTextState createState() =>
      _socketIO_showTextState(title, specialChar, notation);
}

class _socketIO_showTextState extends State<socketIO_showtext> {
  String title;
  String specialChar;
  String notation;
  final double textScale = 50;
  String data = "222";
  bool checkflag = false;
  final text_color = Color.fromRGBO(112, 112, 112, 1.0);
  _socketIO_showTextState(this.title, this.specialChar, this.notation);
  @override
  Widget build(BuildContext context) {
    final dataFromSocket = Provider.of<socketIO_Handler>(context);
    if (this.title == "temp" && dataFromSocket.clientState == true) {
      this.checkflag = true;
    }
    // if (this.title=="hum") {
    //   data=dataFromSocket.hum;
    // }
    // print(dataFromSocket.temp);
    // print(dataFromSocket.hum);
    // print(data);
    // if (dataFromSocket.temp==null ) {
    if (dataFromSocket.clientState == false || dataFromSocket.hum == null) {
      return CircularProgressIndicator();
    } else {
      return Container(
          width: 177,
          height: 70,
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1.0),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  //  dataFromSocket.temp,
                  checkflag ? dataFromSocket.temp : dataFromSocket.hum,
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: textScale,
                      color: text_color),
                ),
                // Text(data,style: TextStyle(fontSize: textScale, fontWeight: FontWeight.w200)),
                Container(
                  width: 15,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 6,
                          left: checkflag ? 3 : 0,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              this.notation,
                            ),
                          )),
                    ],
                  ),
                ),
                Text(this.specialChar,
                    style: TextStyle(
                        fontSize: textScale, fontWeight: FontWeight.w200))
              ],
            ),
          ));
    }
  }
}
