/*
    In this project
    i test how to connect with specific
    Wifi enpoint and check the quility with RSSI
*/
#include "ESP8266WiFi.h"

const String wifi_SSID = "iPhone";
const String wifi_Password = "AL128re/*";

// Config init vars
void setup() {
  // Setting speed on default 
  Serial.begin(115200);
  
  WiFi.mode(WIFI_STA);
  // Try connecting to a real WIFI with specific endpoint
  WiFi.begin(wifi_SSID, wifi_Password);
  while (WiFi.status() != WL_CONNECTED){
      delay(2000);
      Serial.println("try to connecting");
    }
    Serial.println("Connected!");

  
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  int received_RSSI = WiFi.RSSI();
  if (received_RSSI > -25){
        digitalWrite(LED_BUILTIN, HIGH);
        Serial.print("The Custom Wifi enpoint near in point of: ");
        Serial.println(received_RSSI);
  }else{
    digitalWrite(LED_BUILTIN, LOW);
    Serial.print("The Custom Wifi enpoint far in point of: ");
    Serial.println(received_RSSI);
  }
  
  delay(500);
}
