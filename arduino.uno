#include <math.h>


#define Temp A4
#define LUX A5

class Res{
  private:
   String hosts = " ";
   String mail = " ";
   
  public:
   float  temp, lux;
   
   void read(){
   temp = analogRead(Temp)* 5.0 /1024.0;
   temp = -14.46 * log((10000.0 * temp)/(5.0 - temp)/ 27074.0);
    lux = analogRead(LUX); 
  
  }
   void push(int temp,int lux){
  
  Serial.println(hosts+"/save?"+"lux= "+lux+"&"+"val= "+temp);
}
   void warning(String warn){
    Serial.println(hosts+"/send?text="+warn+"&"+"token="+"key=");  
}
    void push_mail(){
     Serial.println(host + "send_push/?mail="+mail+"&"+"key=")
}

  
};




Res re;

void setup() {


Serial.begin(115200);


}

void loop() {
re.read();
delay(100);
re.push(re.temp,re.lux);
delay(600000);



}
