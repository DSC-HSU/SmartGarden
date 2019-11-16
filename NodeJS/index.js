var firebaseConnection = require('./firebaseQuery.js')
console.log(firebaseConnection)
const SerialPort = require('serialport')
const Readline = require('@serialport/parser-readline');
// const port1 = new SerialPort('/dev/cu.usbserial-14220', {
//   baudRate: 19200,
//   autoOpen:false
// })

// var countering=0
// var portScaning=[]

async function main(){
  
  const port2 = await getPort();
  // console.log(port2)
  const parser = port2.pipe(new Readline({ delimiter: '\r\n' }),);

  // port2.on("data",()=>{
  //   console.log("readed")
  // await port2.write("stoppump")
  decoy(parser,port2)
  port2.write("0")
  // })
  
 
  

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
  // port2.write("0")
}
// const port2 = SerialPort()
// const portname=SerialPort.list().then(
//   ports => ports.forEach((portss)=>{
//     let FindingCOM=portss['path']
//     if (FindingCOM.includes('usbserial')) {
//       console.log("found "+ FindingCOM)
//       //  const port2 = new SerialPort(FindingCOM,{
//       //   baudRate:19200,
//       //   autoOpen:true
//       // })
//       return FindingCOM
//       serialWrite("pump")
//     }
//   }),
  
// )
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
    //donothing
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
    //  autoPush(HumTemp)
    //trigger watering

  }
  // ReadSerialJSONTempHum()
}











// async function filterOutPort(AllSerialData){
//   AllSerialData.forEach(Serial => {
//     if (Serial['comName'].include('usbserial')) {
//       return Serial['comName']
//     }
    
//   });
// }

// var acx=Tester()
// console.log(acx)


// console.log(portScaning)

// port1.write("0")
// parser.once('data',(data)=>{
//   console.log(data)
// })

//db

//on added
// logNode.child('test').on('child_added',(childSnapshot,prevChildKey)=>{
  
//   console.log("----");
//   console.log(counter++)
//   console.log(childSnapshot.val());
//   console.log("----");
// })


// logNode.child('timestamp').once('value').then((dataSnapshot)=>{
//   console.log("Read : ")
//   console.log(dataSnapshot.val())
// })






var counting=0

// function handleWatering(Humninity){
//   console.log(counting++)
//   console.log(typeof(Humninity))
//   var Pump = false
//   if (Humninity['temp']>27) {
//     //donothing
//     port1.write("pump")

//     Pump=true
//   }
//   else{
//     // if (Pump=true) {
//     //   port1.write("stoppump");
//     // }
//     console.log('notrunning')
//     port1.write("0")
//     //  autoPush(HumTemp)
//     //trigger watering

//   }
//   ReadSerialJSONTempHum()
// }
 


var HumTemp
//serial

// function ReadSerialJSONTempHum(){
// port1.on("open", () => {
//     console.log('serial port open');
//   });
//   parser.on('data', data =>{
//     // console.log('got word from arduino:', data);
//     // console.log(JSON.parse(data));
//     try {
//       HumTemp = JSON.parse(data);
//       console.log(HumTemp)
//     } catch (error) {
//       console.log(error)
//     }
//     handleWatering(HumTemp)
    
//   });
// }

// function OpenConnection(){
// port1.open(()=>{
//   console.log('open connection')
// })
// }


// const Read=port2.once('readable',()=>{
//   console.log("readable")
//   parser.on('data',(data)=>{
//     let JsonFormatedData = JSON.parse(data);
//     if (JsonFormatedData.hasOwnProperty('temp') && JsonFormatedData.hasOwnProperty('hum')) {
//       if (JsonFormatedData['temp']>27.5) {
//         HandePump(true)
//       }else if(JsonFormatedData['temp'] <= 27.5){
//         console.log('turn off')
//         HandePump(false)
//       }
//       else{
//         PushPumpState(false)
//         PushUserData(JsonFormatedData)
//         port1.write("0")

//       }
//       if(JsonFormatedData.hasOwnProperty('pump')){
//         if (JsonFormatedData['pump']==1) {
//           console.log("turn on pumping")
//           return;
//         }
//         else{
//         console.log(JsonFormatedData)
//         port1.write("0")
//         PushPumpState(true)
//         }
//       }
//       console.log(JsonFormatedData)
//     }
//     JsonFormatedData=null
//   })
  
// })

// function HandePump(State){
//   if (State = true) {
//     console.log("function turning on the pump")
//     // port1.write('pump')
//   }
//   if(State= false){
//     // port1.write("stoppump")
//   }
// }
// // port1.write("0")
// OpenConnection()

// function serialWrite(arg){
//   port2.write(arg,(err)=>{
//     console.log(err)
//   })
//   console.log("write "+arg)
// }

main();