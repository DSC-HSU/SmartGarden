import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smart_garden/ultis/socketIO_handler.dart';

// Color baseColor = Color.fromRGBO(244, 244, 244, 1.0);
Color baseColor = Color(0xFFF2F2F2);

class HuminityIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => socketIO_Handler(),
      child: HuminityIndicatorNotifier(),
    );
  }
}

class HuminityIndicatorNotifier extends StatefulWidget {
  @override
  _HuminityIndicatorNotifierState createState() =>
      _HuminityIndicatorNotifierState();
}

class _HuminityIndicatorNotifierState extends State<HuminityIndicatorNotifier> {
  @override
  Widget build(BuildContext context) {
    final dataFromSocket = Provider.of<socketIO_Handler>(context);
    if (dataFromSocket.clientState != null) {
      double currentValue = dataFromSocket.soildhum * 100 / 1000;
      return dataFromSocket.clientState
          ? Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              height: 100,
              child: LiquidLinearProgressIndicator(
                value: currentValue / 100, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors
                    .lightBlue), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.black12,
                borderWidth: 0.0,
                borderRadius: 12.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: Text(
                  currentValue.floor().toString() + "%",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          : CircularProgressIndicator();
    } else {
      return CircularProgressIndicator();
    }
  }
}
