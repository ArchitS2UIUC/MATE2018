String stuff;
int ledPin1 = 7;
int ledPin2 = 8;
int data[8];
String inputString = "";
boolean dataComplete = false;
boolean stringComplete = false;
int j = 0;
int xposleftstick, yposleftstick, xposrightstick, yposrightstick, righttrigger, lefttrigger, xButton, yButton;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
}

void loop() {
  digitalWrite(ledPin2, HIGH);
  /*if(dataComplete == true){
    if(data[0]>1600){  
      
    }else{
      //digitalWrite(ledPin2, LOW);
    }
    dataComplete = false;
    } */
 }
/*void serialEvent(){
    int i = 0;
    digitalWrite(ledPin1, HIGH);
  while(Serial.available()){
    char inputChar = (char)Serial.read();
    if(inputChar != "/n"){
      inputString += inputChar;
    }else if(inputChar == ','){
      if(j>7){
        digitalWrite(ledPin2, HIGH); 
      }
      data[j] = inputString.toInt();
      inputString = "";
      j++;
    }
    else if(j == 7){
      j=0;
    }
      dataComplete = true;
   }

 }*/
  /*
    //inputString = Serial.readString();
    digitalWrite(ledPin2, LOW);
   while(inputString.length() != 0){
    for(int i = 0; i < 8; i++){
      int index = stuff.indexOf(",");
      data[i] = inputString.substring(0,index).toInt();
      inputString = inputString.substring(index+1); // remove initial number
    }
    
    inputString ="";
   }
             
    
    if(data[0] > 1600){
      digitalWrite(ledPin2, HIGH);
    }
    
  //}
  
}*/





