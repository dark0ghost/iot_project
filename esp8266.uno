#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

const char* ssid = "name wifi";
const char* password = "password";

void setup() {
  Serial.begin(115200);
  WiFi.mode(WIFI_STA); 
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
     
      delay(100);     
  }
  Serial.println("WiFi connected.");
}


String read_s;

void loop() {
    if(Serial.available() == 0) return;  


    read_s = Serial.readString();


    
    if(WiFi.status() != WL_CONNECTED) {
       Serial.println("Cannot send: no WiFi connection");
       return; // Если нет соединения - выходим из функции
    }

 send_m();
}

void send_m(){

    HTTPClient http;
    http.begin(read_s);
    Serial.println("send mail");
     Serial.println(read_s);
     
  http.begin( read_s);     //Specify request destination
  
  int httpCode = http.GET();            //Send the request
  String payload = http.getString();    //Get the response payload
 
  Serial.println(httpCode);   //Print HTTP return code
  Serial.println(payload);
    http.end();
  
}
