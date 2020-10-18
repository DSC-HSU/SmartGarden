import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class streamshowTextWithOption extends StatelessWidget {
  FirebaseDatabase database =
      FirebaseDatabase(databaseURL: 'https://iot-thcntt1.firebaseio.com');
  // final String vaule;
  // final specialChar;
  // final String notation;
  // GlobalKey vaule_key = GlobalKey();
  // showTextWithOption(this.vaule, this.specialChar, this.notation);
  @override
  Widget build(BuildContext context) {
    // double spacing = 30;
    // bool overflowVaule_dectector = false;
    // if (this.vaule.length >= 3) {
    //   overflowVaule_dectector = true;
    // }

    // TODO: implement build
    return StreamBuilder<Event>(
      // stream: callbackonchange.asBroadcastStream(),
      stream:
          FirebaseDatabase.instance.reference().child('user/linh/temp').onValue,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.active) {
          print(snap.data);
          print(snap.data.snapshot.value);
          return Container(
            width: 50,
            height: 50,
            color: Colors.yellow,
            child: Text(
              snap.data.snapshot.value.toString(),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          print('notworking');
          print(snap.data.toString());
          return Text("No data");
        }
      },
    );
  }
}
