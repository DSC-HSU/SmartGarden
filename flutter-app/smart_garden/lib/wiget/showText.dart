import 'package:flutter/material.dart';

class showTextWithOption extends StatelessWidget {
  final String vaule;
  final specialChar;
  final String notation;
  GlobalKey vaule_key = GlobalKey();
  showTextWithOption(this.vaule, this.specialChar, this.notation);
  @override
  Widget build(BuildContext context) {
    double spacing = 30;
    bool overflowVaule_dectector = false;
    if (this.vaule.length >= 3) {
      overflowVaule_dectector = true;
    }

    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(0),
        // alignment: Alignment.center,
        width: 150,
        height: 45,
        // color: Colors.blueGrey,
        child: Stack(children: <Widget>[
          Positioned(
            key: vaule_key,
            // top: 20,
            child: Text(
              this.vaule,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            ),
          ),
          Positioned(
              left: overflowVaule_dectector ? spacing + 40 : 50,
              // top: 20,
              child: Text(
                this.specialChar,
              )),
          Positioned(
              left: overflowVaule_dectector ? spacing + 55 : 64,
              // top: 20,
              child: Text(
                this.notation,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ))
        ]));
  }
}
