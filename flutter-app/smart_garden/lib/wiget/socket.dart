import 'dart:ffi';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';

void main() async {
  //Gcloud

  IO.Socket socket = IO.io('http://35.213.149.38:8000', <String, dynamic>{
  // IO.Socket socket = IO.io('http://127.0.0.1:8000', <String, dynamic>{
    'transports': ['websocket'],
  });
  Object handelDataFromSocket(data){
    return jsonEncode(data);
  }
  void listenData() {
    socket.on("duybeo", (handler) => {
        print(handelDataFromSocket(handler))
      }
    
    );
  }

  listenData();

  // print(socket);
}
