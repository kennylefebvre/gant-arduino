int pinA0 = A0; //analog pin 0
int pinA1 = A1; //analog pin 1
int pinA2 = A2; //analog pin 2
int pinA3 = A3; //analog pin 3
int pinA4 = A4; //analog pin 4 

void setup(){
  Serial.begin(9600);
}

void loop(){
  int readingA0 = analogRead(pinA0);
  int readingA1 = analogRead(pinA1); 
  int readingA2 = analogRead(pinA2); 
  int readingA3 = analogRead(pinA3); 
  int readingA4 = analogRead(pinA4);   

  Serial.print("pouce : ");
  Serial.println(readingA0);
  Serial.print("index : ");
  Serial.println(readingA1);
  Serial.print("majeur : ");
  Serial.println(readingA2);
  Serial.print("annulaire : ");
  Serial.println(readingA4);
  Serial.print("auriculaire : ");
  Serial.println(readingA3); 


  delay(250); //just here to slow down the output for easier reading
}



