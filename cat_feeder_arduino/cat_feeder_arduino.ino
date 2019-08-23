#include "network.h"
#include "devices_manager.h"
#include "led_manager.h"

const int configuredDevicesAmount = 2;

int configuredDevices[configuredDevicesAmount] = {10, 11};
int pos;

void setup() {
  // Initialize serial and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // Attaching the devices on the current machine
  for(pos = 0; pos < configuredDevicesAmount; pos += 1)
  {
    attachDevice(configuredDevices[pos]);
  }

  // Initializing the keep alive led
  initLed();

  // Connecting to the network
  connectToNetwork();
}

void loop() {
  // Led blinks to show the device is alive
  blinkLed();

  // Checking if the devices on the current machine need to feed
  for(pos = 0; pos < configuredDevicesAmount; pos += 1)
  {
    if (isDeviceNeedToFeed(configuredDevices[pos]))
    {
      feedFromDevice(configuredDevices[pos]);
    }
  }

  Serial.println("Going to Sleep!");
  delay(30 * 1000);
  Serial.println("Waking up!");
}
