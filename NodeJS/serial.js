const SerialPort = require('serialport')
const Readline = require('@serialport/parser-readline');
const port = new SerialPort('/dev/cu.usbserial-14240', {
  baudRate: 9600
})


db.child('timestamp').on('child_changed',(childSnapshot,prevChildKey)=>{
  childSnapshot.key
  childSnapshot.val()
  console.log(childSnapshot.val());
})

var x =0;
const parser = port.pipe(new Readline({ delimiter: '\r\n' }));

port.on("open", () => {
    console.log('serial port open');
  });
  parser.on('data', data =>{
    // console.log('got word from arduino:', data);
    // console.log(JSON.parse(data));
    var aaa = JSON.parse(data);
    console.log(aaa)
    console.log(x++)
    // Write(x);
    port.write("0")
    
  });

port.write("0")
function PushtoDB(functions){
    port.on("open", () => {
        console.log('serial port open');
      });
      parser.on('data', data =>{
        // console.log('got word from arduino:', data);
        // console.log(JSON.parse(data));
        var aaa = JSON.parse(data);
        console.log(aaa)
        console.log(x++)
        // Write(x);
        port.write("0")
      });
}
// ReadDB()rval(()=>{
  //   port.write("0")
    
  //   console.log(x++);
  // },1000);
  
  // while (1) {
  //   port.write("0");
  // }