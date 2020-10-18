import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class showTextWithOption extends StatelessWidget {
  FirebaseDatabase database = FirebaseDatabase(databaseURL: 'https://iot-thcntt1.firebaseio.com');
  final specialChar;
  final String notation;
  final String db_Path;
  final double textScale=50;
  final text_color= Color.fromRGBO(112, 112, 112, 1.0);
  showTextWithOption(this.db_Path,this.specialChar, this.notation);
  @override
  Widget build(BuildContext context) {
    bool istrigger=false;
    bool flag = false;
    if (this.specialChar=="o") {
      flag= true;
    }
    return StreamBuilder<Event>(
        // stream: callbackonchange.asBroadcastStream(),
        stream: FirebaseDatabase.instance
            .reference()
            .child(this.db_Path)
            .onValue,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.active) {
            istrigger=!istrigger;
            print(snap.data.snapshot.value);
            var data = snap.data.snapshot.value.toString();
            var data_lenght = data.length;
            print(data_lenght);
          return Container(
                width: 173,
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255,255,255,1.0),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                        style: istrigger?
                        TextStyle(
                          fontSize: textScale,
                          color: text_color,
                          fontWeight: FontWeight.w200
                        )
                        :TextStyle(
                          fontSize: textScale,
                          color: text_color,
                          fontWeight: FontWeight.w200
                        ),
                        duration: Duration(microseconds: 300),
                        curve: Curves.linear,
                        child:Text(data)
                      ),
                      // Text(data,style: TextStyle(fontSize: textScale, fontWeight: FontWeight.w200)),
                      Container(
                        width: 15,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                        top: 6,
                        left: flag?3:0,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              this.specialChar,
                            ),
                          )),
                          ],
                        ),
                      ),
                      Text(notation,style: TextStyle(fontSize: textScale, fontWeight: FontWeight.w200))
                    ],
                  ),
                ));
          }
           else{
            return CircularProgressIndicator();
          }
        });
  
        }
}
                // child: Container(
                //   child: Stack(children: <Widget>[
                //     Positioned(
                //       left: 10,
                //       child: Text(
                //         data,
                //         // '123456',
                //         style:
                //             TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
                //       ),
                //     ),
                //     Positioned(
                //       top: 6,
                //         // left: specailchar_spacing,
                //         // top: 20,
                //         child: Align(
                //           alignment: Alignment.centerRight,
                //           child: Text(
                //             this.specialChar,
                //           ),
                //         )),
                //     Positioned(
                //         // left: notation_spacing,
                //         // top: 20,
                //         child: Align(
                //           alignment: Alignment.centerRight,
                //           child: Text(
                //             this.notation,
                //             style: TextStyle(
                //                 fontSize: 50, fontWeight: FontWeight.w200),
                //           ),
                //         ))
                //   ]
                //   ),
                // )