// var firebaseConnection = require('./src/firebaseQuery.js')
var socketConnection = require('./src/socketIO_Pushdata.js');
const SerialPort = require('serialport')
const Readline = require('@serialport/parser-readline');
async function main(){
  const port2 = await getPort();
  const parser = port2.pipe(new Readline({ delimiter: '\r\n' }),);
  decoy(parser,port2)
  port2.write("0")

}
 function decoy(parser,port2){
  parser.on("data",(UnFormatedData)=>{
    let JsonFormatedData = JSON.parse(UnFormatedData);
    console.log(JsonFormatedData)
    try {
      if (JsonFormatedData.hasOwnProperty("temp")) {
        handleWatering(JsonFormatedData,port2)
      }
    } catch (error) {
      console.log(error)
    }
    console.log("clean cache")
    JsonFormatedData=[]
  }
  )
}

async function getPort(){
const port2 = new SerialPort(await serialScan(),{
  baudRate:19200,
  autoOpen:true
})
 return port2;
}
async function serialScan(){
  let ports = await SerialPort.list();
  for(let i =0;i<ports.length;i++){
    if (ports[i]['path'].toLowerCase().includes('usb')) {
      return ports[i]['path']
    }
  }
}

function handleWatering(Humninity,port1){
  console.log(typeof(Humninity))
  if (Humninity['soildhum']>700) {
    port1.write("1")
  }
  else{
    console.log('GET sensor TEMP and HUM')
    port1.write("0")
  }
  //Firebase version

  // firebaseConnection.PushUserData(Humninity)

  // Socket Version
  socketConnection.EmitData('iot-flutter-demo',Humninity)
}












main();