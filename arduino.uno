
#include <SoftwareSerial.h>
#include <math.h>

#define button 7
#define Temp A4
#define LUX A5

SoftwareSerial esp8266(4,5);
unsigned long timing;

class Res{
  private:
 
   String hosts = "";
   String mail = "";
   
  public:
   float  temp, lux;
   
   void read(){
   temp = analogRead(Temp)* 5.0 /1024.0;
   temp = (-14.46 * log((10000.0 * temp)/(5.0 - temp)/ 27074.0))+11;
    lux = analogRead(LUX)/8; 
  
  }
   void push(int temp,int lux){

    Serial.println(hosts+"save?"+"val="+temp+"&lux="+lux);
    esp8266.println(String("val=")+temp+String("&lux=")+lux);
}
   void warning(String warn){
    Serial.println(hosts+"/send?text="+warn+"&"+"token="+"key=");  
    esp8266.println((hosts+"/send?text="+warn+"&"+"token="+"key="));
}
    void push_mail(){
     Serial.println(hosts + "/send_push/?mail="+mail+"&"+"key=String");
      esp8266.println(hosts +"/send_push/?mail="+mail+"&"+"key=String");
    }

  
};



Res re;

void setup() {
  pinMode(4, INPUT);
  pinMode(5, OUTPUT);

  pinMode(button,INPUT_PULLUP);
  Serial.begin(115200);
  esp8266.begin(9600);

}

void loop() {
 
if (millis()-timing>=6000){
  timing = millis();
  re.read();
  re.push(re.temp,re.lux);

}

if (esp8266.available()>0 ) {
  Serial.println( esp8266.readString());
}
 
}
