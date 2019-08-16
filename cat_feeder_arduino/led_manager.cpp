#include <Arduino.h>

void initLed() {
  pinMode(LED_BUILTIN, OUTPUT);
}

void blinkLed() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN, LOW);
}
