#include <Servo.h>
#include <Arduino.h>
#include "device.h"

Servo curServo;

device::device() {

}

device::device(int pin)
{  
  Serial.print("Attaching device: ");
  Serial.println(pin);
  
  servoPin = pin;
}

void device::feedFromDevice()
{
  Serial.print("starting feed for device id: ");
  Serial.println(servoPin);
  curServo.attach(servoPin);
  
  if(!curServo.attached())
  {    
    Serial.println("Servo not attached ending feed.");
    return;
    
  }
  
  for (pos = 0; pos <= 160; pos += 1) { 
    // in steps of 1 degree
    curServo.write(pos);              
    delay(10);                       
  }
  for (pos = 160; pos >= 0; pos -= 1) { 
    curServo.write(pos);              
    delay(10);                       
  }
  
  Serial.println("ending feed.");
  curServo.detach();
}
