#include <SPI.h>
#include <WiFiNINA.h>
#include "arduino_secrets.h"
#include "network.h"

///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = SECRET_SSID;        // your network SSID (name)
char pass[] = SECRET_PASS;    // your network password (use for WPA, or use as key for WEP)
int status = WL_IDLE_STATUS;     // the WiFi radio's status
int serverPort = 80;

// server address:
const char domain[] = "www.amazonaws.com";
const char server[] = "https://irw3hewccf.execute-api.us-east-2.amazonaws.com/PROD/";
const char getFeedsURL[] = "/PROD/%7Bfeedsapi+%7D?TableName=Feeds&DeviceId=11";
const char deleteFeedsURL[] = "/PROD/%7Bfeedsapi+%7D";
const char googleHostName[] = "www.google.com";

// Specify IP address or hostname
String postData;
String Response;
int pingResult;

// Initialize the Wifi client library
WiFiClient client;

///////////////////////////////////////////////////////// Network Methods /////////////////////////////////////////////////////////
void connectToNetwork() {
  // check for the WiFi module:
  if (WiFi.status() == WL_NO_MODULE) {
    Serial.println("Communication with WiFi module failed!");
    // don't continue
    while (true);
  }

  String fv = WiFi.firmwareVersion();
  if (fv < "1.0.0") {
    Serial.println("Please upgrade the firmware");
  }

  // attempt to connect to WiFi network:
  while ( status != WL_CONNECTED) {
    Serial.print("Attempting to connect to WPA SSID: ");
    Serial.println(ssid);
    // Connect to WPA/WPA2 network:
    status = WiFi.begin(ssid, pass);

    // wait 5 seconds for connection:
    delay(5000);
  }

  // you're connected now, so print out the data:
  Serial.println("You're connected to the network");
  printCurrentNet();
  printWiFiData();  
}

void pingGoogle() {
  
  Serial.print("Pinging ");
  Serial.print(googleHostName);
  Serial.print(": ");

  pingResult = WiFi.ping(googleHostName);

  if (pingResult >= 0) {
    Serial.print("SUCCESS! RTT = ");
    Serial.print(pingResult);
    Serial.println(" ms");
  } else {
    Serial.print("FAILED! Error code: ");
    Serial.println(pingResult);
  }
}

void printWiFiData() {
  // print your board's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP address : ");
  Serial.println(ip);

  Serial.print("Subnet mask: ");
  Serial.println((IPAddress)WiFi.subnetMask());

  Serial.print("Gateway IP : ");
  Serial.println((IPAddress)WiFi.gatewayIP());

  // print your MAC address:
  byte mac[6];
  WiFi.macAddress(mac);
  Serial.print("MAC address: ");
  printMacAddress(mac);
}

void printCurrentNet() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print the MAC address of the router you're attached to:
  byte bssid[6];
  WiFi.BSSID(bssid);
  Serial.print("BSSID: ");
  printMacAddress(bssid);
  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI): ");
  Serial.println(rssi);

  // print the encryption type:
  byte encryption = WiFi.encryptionType();
  Serial.print("Encryption Type: ");
  Serial.println(encryption, HEX);
  Serial.println();
}

void printMacAddress(byte mac[]) {
  for (int i = 5; i >= 0; i--) {
    if (mac[i] < 16) {
      Serial.print("0");
    }
    Serial.print(mac[i], HEX);
    if (i > 0) {
      Serial.print(":");
    }
  }
  Serial.println();
}

///////////////////////////////////////////////////////// Server Methods /////////////////////////////////////////////////////////

void deleteFeedFromServer(String feedId) {
  postData = "{\"Key\": { \"" + feedId + "\" : \"3\" }, \"TableName\": \"Feeds\"}";

  // close any connection before send a new request.
  // This will free the socket on the Nina module
  client.stop();
  
  if (client.connect(domain, serverPort)) {
    client.println("POST /test/post.php HTTP/1.1");
    client.print("Host: ");
    client.println(server);
    client.print("Path: ");
    client.println(deleteFeedsURL);
    client.println("Connection: keep-alive");
    client.println("Content-Type: application/json");
    client.print("Content-Length: ");
    client.println(postData.length());
    client.println();
    client.print(postData);

    // wait 5 seconds for response:
    delay(5000);
    // if there are incoming bytes available
    // from the server, read them and print them:
    while (client.available()) {
      char c = client.read();
      Serial.print(c);
    }
    
    Serial.println();
  }
  else {
    // if you couldn't make a connection:
    Serial.println("connection failed");    
  }
}


bool isDeviceNeedToFeed(int deviceId) {

  // close any connection before send a new request.
  // This will free the socket on the Nina module
  client.stop();
  
  Serial.print("Checking if device: ");
  Serial.print(deviceId);  
  Serial.println(" needs to feed the cat.");

  // if there's a successful connection:
  if (client.connect(domain, serverPort)) {
    Serial.println("Getting all ...");
    
    // send the HTTP GET request:
    client.println("GET / HTTP/1.1");
    client.print("Host: ");
    client.println(server);
    client.println("User-Agent: ArduinoWiFi/1.1");
    client.println("Connection: keep-alive");
    client.println();

    // wait 10 seconds for response:
    delay(10000);

    Response = GetResponse();

    Serial.println();
  } else {
    // if you couldn't make a connection:
    Serial.println("connection failed");
  }
  
  return true;
}

String GetResponse() {
    // if there are incoming bytes available
    // from the server, read them and print them:
    while (client.available()) {
      char c = client.read();
      Serial.print(c);
    }
}
