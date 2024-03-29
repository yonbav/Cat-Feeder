#include <SPI.h>
#include <WiFiNINA.h>
#include <ArduinoHttpClient.h>
#include <ArduinoJson.h>
#include "arduino_secrets.h"
#include "network.h"

///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = SECRET_SSID;        // your network SSID (name)
char pass[] = SECRET_PASS;    // your network password (use for WPA, or use as key for WEP)
int status = WL_IDLE_STATUS;     // the WiFi radio's status
int serverPort = 443;

// Response
const char ItemsTag[] = "Items";
const char CountTag[] = "Count";
const char IdTag[]    = "Id";
StaticJsonDocument<200> doc;

// server address
const char server[] = "irw3hewccf.execute-api.us-east-2.amazonaws.com";
const String getFeedsPath = "/PROD/%7Bfeedsapi+%7D?TableName=Feeds&DeviceId=";
const char deleteFeedsPath[] = "/PROD/%7Bfeedsapi+%7D";

// Initialize the Wifi client library
WiFiSSLClient wifi;
HttpClient client = HttpClient(wifi, server, serverPort);

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

bool isDeviceNeedToFeed(int deviceId) {
  Serial.print("Checking if device ");
  Serial.print(deviceId);
  Serial.println(" needs to feed the cat.");

  // Creating the request path with the right id
  String feedsPath = getFeedsPath + String(deviceId);
  int strLen = feedsPath.length() + 1;
  char feedsPathCharArray[strLen];
  feedsPath.toCharArray(feedsPathCharArray, strLen );

  // Creating the get http request
  client.get(feedsPathCharArray);

  // read the status code and body of the response
  int statusCode = client.responseStatusCode();
  String response = client.responseBody();

  Serial.print("StatusCode: ");
  Serial.println(statusCode);
  Serial.print("Response: ");
  Serial.println(response );

  if (GetFeedsCountFromResponse(response) <= 0)
  {
    Serial.print("Device ");
    Serial.print(deviceId);
    Serial.println(" does not need to feed.");
    return false;
  }

  // We remove from server all feeds found in the response and return true;
  RemoveAllFeedsInResponse(response);
  return true;
}


void deleteFeedFromServer(String feedId) {
  Serial.print("Deleting Feed id: ");
  Serial.print(feedId);
  Serial.println(" from server.");

  String contentType = "application/json";
  String postData = "{    \"Key\": {        \"Id\": \"" + feedId + "\"    },    \"TableName\": \"Feeds\" }";

  client.post(getFeedsPath, contentType, postData);

  // read the status code and body of the response
  int statusCode = client.responseStatusCode();
  String response = client.responseBody();

  Serial.print("StatusCode: ");
  Serial.println(statusCode);
  Serial.print("Response: ");
  Serial.println(response );
}


void RemoveAllFeedsInResponse(String response) {
  int feedsCount = GetFeedsCountFromResponse(response);

  // if the response is not in the expected format success response
  if (response.indexOf(CountTag) < 0 || response.indexOf(ItemsTag) < 0)
  {
    Serial.println("Response received was not in the expected format!");
    return 0;
  }

  // Deserialize the JSON document
  DeserializationError error = deserializeJson(doc, response);

  // Test if parsing succeeds.
  if (error) {
    Serial.print(F("deserializeJson() failed: "));
    Serial.println(error.c_str());
    return 0;
  }

  for (int i = 0; i < feedsCount; i++)
  {
    String FeedId = doc[ItemsTag][i][IdTag];
    deleteFeedFromServer(FeedId);
  }
}

int GetFeedsCountFromResponse(String response) {
  // if the response is not in the expected format success response
  if (response.indexOf(CountTag) < 0 || response.indexOf(ItemsTag) < 0)
  {
    Serial.println("Response received was not in the expected format!");
    return 0;
  }

  // Deserialize the JSON document
  DeserializationError error = deserializeJson(doc, response);

  // Test if parsing succeeds.
  if (error) {
    Serial.print(F("deserializeJson() failed: "));
    Serial.println(error.c_str());
    return 0;
  }

  int count = doc[CountTag];
  return count;
}
