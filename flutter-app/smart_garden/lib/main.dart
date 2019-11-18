import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_garden/wiget/showText.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
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
              top: _height*8/100,
              left: 100,
              child: SvgPicture.asset('assets/plan_dirt.svg'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
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
            // Container(
            //   child: Positioned(
            //     left: _width*10/100,
            //     bottom: _height*50/100,
            //     child: Text("23",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w200))
            //   ),
            // ),
