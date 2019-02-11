#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

const char* ssid = "name hotstop";
const char* password = "wifi password";

String read_s;

 class check {
  
  private:
  HTTPClient http;
  public:
  void send_m(String re){

    
    http.begin(re);//Specify request destination
    
    Serial.println("send mail");
    Serial.println(re);
     
    http.GET();            //Send the request
     
 

  Serial.println(http.getString());  //Get the response payload
  
  http.end();
  
}
  
  };
check check1;
void setup() {
  Serial.begin(115200);
  WiFi.mode(WIFI_STA); 
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
     
      delay(100);     
  }
  Serial.println("WiFi connected.");
}




void loop() {
    if(Serial.available() == 0) return;  


    read_s = Serial.readString();


    
    if(WiFi.status() != WL_CONNECTED) {
       Serial.println("Cannot send: no WiFi connection");
       return; // Если нет соединения - выходим из функции
    }

check1.send_m(read_s);
 
}
