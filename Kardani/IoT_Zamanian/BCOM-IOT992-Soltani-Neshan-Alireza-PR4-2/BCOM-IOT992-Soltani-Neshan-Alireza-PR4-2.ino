/*
 *  ESP8266 JSON Decode of server response
 *  - Alireza Soltani Neshan | 98111033302016
 *  - project 5
 *  - IoT
 */

#include <ESP8266WiFi.h>
#include <WiFiClient.h> 
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

const char* wifiName = "iPhone";
const char* wifiPass = "AL20re/*";

//Web Server address to read/write from 
const char *host = "http://172.20.10.9:4001/5";

void setup() {
  
  Serial.begin(115200);
  delay(10);
  Serial.println();
  
  Serial.print("Connecting to ");
  Serial.println(wifiName);

  WiFi.begin(wifiName, wifiPass);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());   //You can get IP address assigned to ESP
}

void loop() {
  HTTPClient http;    //Declare object of class HTTPClient
  

  Serial.print("Request Link:");
  Serial.println(host);
  
  http.begin(host);     //Specify request destination
  
  int httpCode = http.GET();            //Send the request
  String payload = http.getString();    //Get the response payload from server

  Serial.print("Response Code:"); //200 is OK
  Serial.println(httpCode);   //Print HTTP return code

  Serial.print("Returned data from Server:");
  Serial.println(payload);    //Print request response payload
  
  if(httpCode == 200)
  {
    // Allocate JsonBuffer
    // Use arduinojson.org/assistant to compute the capacity.
    const size_t capacity = JSON_OBJECT_SIZE(10) + JSON_ARRAY_SIZE(8) + 60;
    DynamicJsonBuffer jsonBuffer(capacity);
  
   // Parse JSON object
    JsonObject& root = jsonBuffer.parseObject(payload);
    if (!root.success()) {
      Serial.println(F("Parsing failed!"));
      return;
    }
  
    // Decode JSON/Extract values
    Serial.println("===============Your Res as Info===============");
    Serial.println(F("Response:"));
    Serial.println("Name of Country:");
    Serial.println(root["name"].as<char*>());
    Serial.println(root["country"].as<char*>());
    Serial.println("Description:");
    Serial.println(root["description"].as<char*>());
    Serial.println("Latitude:");
    Serial.println(root["latitude"].as<char*>());
    Serial.println("Longitude:");
    Serial.println(root["longitude"].as<char*>());
  }
  else
  {
    Serial.println("Error in response");
  }

  http.end();  //Close connection
  
  delay(5000);  //GET Data at every 5 seconds
}
