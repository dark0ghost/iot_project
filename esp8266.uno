#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

const char* ssid = "";
const char* password = "";

String read_s;

 class check {
  
  private:
  HTTPClient http;
  String host = "";

  public:
  void send_m(String re){

 
    http.begin(host+re);  //Specify request destination
    int httpCode = http.GET();                                                                  //Send the request
 
    if (httpCode > 0) { //Check the returning code
      String payload = http.getString();   //Get the request response payload
      Serial.println(httpCode); 
       Serial.println(host+re);//Print the response payload
    }
    http.end();   //Close connection
  }
  
  };
check check1;
void setup() {
  Serial.begin(9600);
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
