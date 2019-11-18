import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_garden/wiget/showText.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
              top: _height*8/100,
              left: 100,
              child: SvgPicture.asset('assets/plan_dirt.svg'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              // height: 100,
              child: Container(
                height: _height*60/100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 244,244,1.0) ,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)
                  )
                ),
                
              ),
            ),
            Positioned(
              left: _width*10/100,
              top: _height*45/100
              ,child:showTextWithOption("99", "o", "C")
            ),
            Positioned(
              left: _width*10/100,
              top: _height*53/100
              ,child:showTextWithOption("100", "%", "H")
            ),
            // Container(
            //   child: Positioned(
            //     left: _width*10/100,
            //     bottom: _height*50/100,
            //     child: Text("23",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w200))
            //   ),
            // ),
            FloatingActionButton(
              child: Text("Click"),
              onPressed: (){
                print("width " + _width.toString());
                print("height " + _height.toString());
              },
            )
          ],
        ),
      );
  }
}
