var firebaseConnection = require('./firebaseQuery.js')
// console.log(firebaseConnection)
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
      
    }
  })
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
    if (ports[i]['path'].includes('usbserial')) {
      return ports[i]['path']
    }
  }
}

function handleWatering(Humninity,port1){
  console.log(typeof(Humninity))
  var Pump = false
  if (Humninity['temp']>35) {
    port1.write("pump")

    Pump=true
  }
  else{
    try {
      firebaseConnection.PushUserData(Humninity)
    } catch (error) {
      console.log(error)
    }
    console.log('GET sensor TEMP and HUM')
    port1.write("0")

  }
}












main();