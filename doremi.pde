import processing.serial.*;

import cc.arduino.*;
import processing.sound.*;

SoundFile[] file;
int numsounds = 4;
float a=0.0f;
float b=0.0f;
float pot=0;
float octave=0;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);


void setup() {
  size(640, 360);
  arduino = new Arduino(this, "COM4", 57600);
  for (int i = 0; i <= 13; i++) {
    arduino.pinMode(i, Arduino.INPUT);
     file = new SoundFile[numsounds];
  }  
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }
}

void draw() {
  pot = arduino.analogRead(6);
  octave= map(pot, 0.0,0.0,1023.0,255.0);
  
  
  if(octave<100){
    a=0.5;
    b=1.0;
  }
  else if(octave>=100){
    a=2.0;
    b=1.0;
  }
  
    if (arduino.digitalRead(2) == Arduino.HIGH)
       file[0].play(a, b);
    else if (arduino.digitalRead(3) == Arduino.HIGH)
       file[1].play(a, b);
    else if (arduino.digitalRead(4) == Arduino.HIGH)
       file[1].play(a, b);
    else if (arduino.digitalRead(5) == Arduino.HIGH)
       file[1].play(a, b);
     
  
}
