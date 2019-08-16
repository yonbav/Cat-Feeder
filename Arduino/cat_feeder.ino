#include <SPI.h>
#include <WiFiNINA.h>
#include "network.h"
#include "devices_manager.h"

const int deviceId = 111;
const int devicePin = 9;

// Specify IP address or hostname
String hostName = "www.google.com";
int pingResult;

void setup() {
  // Initialize serial and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  
  attachDevice(deviceId, devicePin);
  connectToNetwork();
}

void loop() {
  Serial.print("Pinging ");
  Serial.print(hostName);
  Serial.print(": ");

  pingResult = WiFi.ping(hostName);

  if (pingResult >= 0) {
    Serial.print("SUCCESS! RTT = ");
    Serial.print(pingResult);
    Serial.println(" ms");
  } else {
    Serial.print("FAILED! Error code: ");
    Serial.println(pingResult);
  }

  feedFromDevice(devicePin);

  delay(5000);
}
