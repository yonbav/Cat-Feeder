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

void attachDevice(int devicePin) {   
  if (!checkIsPinValid(devicePin))
  {
    Serial.println("Failed initializing device!");
    return;
  }

  // Creating the new device
  device* newDevice = new device(devicePin);
  _devices[devicePin] = *newDevice;
}

void feedFromDevice(int devicePin) {
  if (!checkIsPinValid(devicePin))
  {
    return;
  }
  
  _devices[devicePin].feedFromDevice();  
}
