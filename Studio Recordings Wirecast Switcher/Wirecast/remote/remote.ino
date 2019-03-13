int led = 3;
#define remote1 2
#define remote2 A3

boolean recording = false;  // variable to store recording state
int val = 0;     // variable to store the read value
int incomingByte = 0;   // for incoming serial data

void setup()
{
  pinMode(led, OUTPUT);        // sets the digital pin as output
  pinMode(remote1, OUTPUT);    // sets the digital pin as output
  pinMode(remote2, OUTPUT);    // sets the digital pin as output
  Serial.begin(9600);
}

void loop()
{
  // send data only when you receive data:
  if (SerialUSB.available() > 0) {
          // read the incoming byte:
          incomingByte = SerialUSB.read();
  
          // say what you got:
          SerialUSB.print(F("I received: "));
          SerialUSB.println(incomingByte, DEC);
          if (incomingByte == 49) pushButton();
  }
}

void pushButton()
{
  // Briefly turn on internal transistor to short 
  // the Record button leads and simulate a button press
  // then turn transistor off
  digitalWrite(remote1, HIGH);
  digitalWrite(remote2, HIGH);
  delay(100);   // delay to debounce switch
  digitalWrite(remote1, LOW);
  digitalWrite(remote2, LOW);
  recording = !recording;
  digitalWrite(led, recording);
}



