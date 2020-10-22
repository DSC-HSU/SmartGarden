import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_garden/ultis/socketIO_handler.dart';

// Color baseColor = Color.fromRGBO(244, 244, 244, 1.0);
Color baseColor = Color(0xFFF2F2F2);

class PumpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => socketIO_Handler(),
      child: PumpButtonNotifier(),
    );
  }
}

class PumpButtonNotifier extends StatefulWidget {
  @override
  _PumpButtonNotifierState createState() => _PumpButtonNotifierState();
}

class _PumpButtonNotifierState extends State<PumpButtonNotifier> {
  @override
  Widget build(BuildContext context) {
    final dataFromSocket = Provider.of<socketIO_Handler>(context);
    if (dataFromSocket.clientState != null) {
      return dataFromSocket.clientState
          ? Container(
              child: GestureDetector(
                onTap: () =>
                    {print("Call Button"), dataFromSocket.emitRequestPump()},
                child: ClayContainer(
                  emboss: dataFromSocket.tooglePump,
                  color: baseColor,
                  width: 100,
                  height: 100,
                  child: Center(child: SvgPicture.asset('assets/water.svg')),
                ),
              ),
            )
          : CircularProgressIndicator();
    } else {
      return CircularProgressIndicator();
    }
  }
}
