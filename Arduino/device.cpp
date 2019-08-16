#include <Servo.h>
#include <Arduino.h>
#include "device.h"

device::device() {

}

device::device(int id, int pin)
{  
  Serial.print("Attaching device: ");
  Serial.print(id);
  Serial.print(" to pin: ");
  Serial.println(pin);
  
  deviceId = id;
  servoPin = pin;
  servo.attach(pin);
}

void device::feedFromDevice()
{
  Serial.println("starting feed.");
  
  for (int pos = 0; pos <= 160; pos += 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    servo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(5);                       // waits 15ms for the servo to reach the position
  }
  for (int pos = 160; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
    servo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(5);                       // waits 15ms for the servo to reach the position
  }
  
  Serial.println("ending feed.");
}
