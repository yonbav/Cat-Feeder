#include <Arduino.h>
#include <Servo.h>
#include "device.h"

const int MAX_DEVICES = 14;

device _devices[MAX_DEVICES];

bool checkIsPinValid (int pin) {  
  // Sanity check for the pinouts
  if (pin < 0 || pin >= MAX_DEVICES)
  {
    Serial.print("Pin ");
    Serial.print(pin);
    Serial.println(" is not a valid pin");

    return false;
  }

  return true;
}

void attachDevice(int deviceId, int pin) {   
  if (!checkIsPinValid(pin))
  {
    return;
  }

  // Creating the new device
  device* newDevice = new device(deviceId, pin);
  _devices[pin] = *newDevice;
}

void feedFromDevice(int pin) {    
  if (!checkIsPinValid(pin))
  {
    return;
  }
  
  _devices[pin].feedFromDevice();  
}
