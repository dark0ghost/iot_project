#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

const char* ssid = "login";
const char* password = "wifi password";

void setup() {
  Serial.begin(115200);
  WiFi.mode(WIFI_STA); 
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
      Serial.println("Waiting for WiFi...");
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

    
    HTTPClient request;
    request.begin(read_s);
    Serial.println("send mail");
    request.end();
}
