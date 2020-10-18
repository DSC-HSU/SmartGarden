#include "DHT.h"        // including the library of DHT11 temperature and humidity sensor
#define DHTTYPE DHT11   // DHT 11

#define dht_dpin 8
DHT dht(dht_dpin, DHTTYPE); 
#define pumPin 7

String answer="";
float h=0;
float t =0;
float soildHum=0;
void setup() {
  // put your setup code here, to run once:
  digitalWrite(pumPin,LOW); // Turn off the Pump by default 
  Serial.begin(19200);
  pinMode(A0, INPUT);
  pinMode(pumPin,OUTPUT);
  dht.begin();
  delay(700);
}

void loop() {
  // start Reeding soildHum as loop cause soild huminity has slow response time
  soildHum = analogRead(A0);
  if(Serial.available()){
      answer=Serial.readString();
      if(answer=="0"){
           digitalWrite(pumPin,LOW);
           h = dht.readHumidity();
           t= dht.readTemperature();
           
           if (isnan(h) || isnan(t)){ 
            return;
           }else{
            Serial.println("{\"temp\":"+ String(t)+",\"hum\":"+String(h)+",\"soildhum\":"+String(soildHum)+",\"pump\":"+"0"+"}");
           }
        }
      if(answer=="1"){
           digitalWrite(pumPin,HIGH);
           h = dht.readHumidity();
           t= dht.readTemperature();
           
           if (isnan(h) || isnan(t)){ 
            return;
           }else{
            Serial.println("{\"temp\":"+ String(t)+",\"hum\":"+String(h)+",\"soildhum\":"+String(soildHum)+",\"pump\":"+"1"+"}");
           }
        }    
    }
}
