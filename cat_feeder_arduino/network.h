void connectToNetwork();
void printWiFiData();
void printCurrentNet();
void printMacAddress(byte mac[]);
bool isDeviceNeedToFeed(int deviceId);
void deleteFeedFromServer(String feedId);
void RemoveAllFeedsInResponse(String response);
int GetFeedsCountFromResponse(String response);
