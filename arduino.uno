String host = " ";
#define Temp A4
#define LUX A5
void setup() {


Serial.begin(115200);


}

void loop() {

}

void push(int temp,int lux){
  
  Serial.println(host+"/save?"+"lux="+lux+"&"+"val="+temp);
}
void warning(String warn){
    Serial.println(host+"/send?text="+warn+"&"+"token= "+"key="); // i use host https://github.com/dark0ghost/dj-hook  
}
void read_ (){
 int  temp = analogRead(Temp); 
  int  lux = analogRead(LUX); 
  return temp,lux;
  }
