#include "DHT.h"        // including the library of DHT11 temperature and humidity sensor
#define DHTTYPE DHT11   // DHT 11

#define dht_dpin 0
DHT dht(dht_dpin, DHTTYPE); 
#define pumPin 16

String answer="";
float h=0;
float t =0;
float soildHum=0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(19200);
  pinMode(A0, INPUT);
  pinMode(pumPin,OUTPUT);
  dht.begin();
  delay(700);
  digitalWrite(pumPin,LOW);
  
}

void loop() {
  if(Serial.available()){
      answer=Serial.readString();
      if(answer=="0"){
           h = dht.readHumidity();
           t= dht.readTemperature();
           if (isnan(h) || isnan(t)){ 
            return;
           }else{
            Serial.println("{\"temp\":"+ String(t)+",\"hum\":"+String(h)+"}");
           }
        }
      if(answer=="pump"){
          digitalWrite(pumPin,HIGH);
          Serial.println("{\"pump\":"+String(true)+"}");
           return;
        }
      if(answer=="stoppump"){
          digitalWrite(pumPin,LOW);
          Serial.println("{\"pump\":"+String(false)+"}");
           return;
        }
      if(answer=="soildhum"){
          soildHum = analogRead(A0);
          Serial.println("{\"soildhum\":"+String(soildHum)+"}");
           return;
        }
      
    }
}
