import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_garden/ultis/socketIO_handler.dart';
import 'package:smart_garden/wiget/showText.dart';
import 'package:smart_garden/wiget/stream_showText.dart';
import 'package:smart_garden/wiget/socket_showText.dart';
import 'package:smart_garden/wiget/showPump.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: MyHomePage(),
        body: MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    var backgourndColor = Color.fromRGBO(144, 144, 144, 1.0);
     double _width = MediaQuery.of(context).size.width;
     double _height = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _height*1/100,
              left: _width*40/100,
              child: wateringNotifier(),
            ),
            Positioned(
              top: _height*8/100,
              left: _width*25/100,
              child: SvgPicture.asset('assets/plan_dirt.svg'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: _height*60/100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 244,244,1.0) ,
                  // color: Colors.black26,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)
                  )
                ),  
              ),
            ),
            Positioned(
              left: _width*10/100,
              top: _height*45/100,
              child:socketIO_Controller("temp","o","C")
            ),
            Positioned(
              left: _width*10/100,
              top: _height*58/100,
              child:socketIO_Controller("hum","%","H")
            ),
          ],
        ),
      );
  }
}