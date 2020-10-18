import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_garden/ultis/socketIO_handler.dart';

class wateringNotifier extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      builder: (context) => socketIO_Handler(),
      child: _wateringNotifier(),
    );
  }
}
class _wateringNotifier extends StatefulWidget{
  @override
  _wateringNotifierState createState() => _wateringNotifierState();

}
class _wateringNotifierState extends State<_wateringNotifier>{
  @override
  Widget build(BuildContext context) {
    final dataFromSocket = Provider.of<socketIO_Handler>(context);
    return Container(
      height: 100,
      width: 100,
      child: AnimatedOpacity(
          duration: Duration(
            milliseconds: 300
          ),
          opacity: (dataFromSocket.pumpState!=null)?(dataFromSocket.pumpState.toDouble()):0,
          child: SvgPicture.asset('assets/water.svg'),
        ),
    );
  }

}