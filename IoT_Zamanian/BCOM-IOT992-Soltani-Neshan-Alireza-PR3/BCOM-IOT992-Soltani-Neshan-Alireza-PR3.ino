/*
 *  This sketch demonstrates how to set up a simple HTTP-like server.
 *  The server will set a GPIO pin depending on the request
 *    http://server_ip/gpio/0 will set the GPIO2 low,
 *    http://server_ip/gpio/1 will set the GPIO2 high
 *  server_ip is the IP address of the ESP8266 module, will be 
 *  printed to Serial when the module is connected.
 */

#include <ESP8266WiFi.h>

  const char *ssid = "sofa";  //ENTER YOUR WIFI SETTINGS
  const char *password = "AL20re/*";

// Create an instance of the server
// specify the port to listen on as an argument
WiFiServer server(80);

void setup() {
  Serial.begin(9600);
  delay(10);

  // prepare GPIO2
  pinMode(D4, OUTPUT);
  digitalWrite(2, 0);
  
  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
   //------------------------------------
 Serial.print("ESP Board MAC Address:  ");
  Serial.println(WiFi.macAddress());
  //------------------------------------
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  
  // Start the server
  server.begin();
  Serial.println("Server started");

  // Print the IP address
  Serial.println(WiFi.localIP());
//  server.on("/", handleRoot);
}

void loop() {
 bool x=0;
  // Check if a client has connected
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
  
  // Wait until the client sends some data
  Serial.println("new client");
  
  while(!client.available()){
    delay(1);
  }
  
  // Read the first line of the request
  String req = client.readStringUntil('\r');
    Serial.println("req=---------------------");
  Serial.println(req);
  client.flush();
  //http://192.168.1.100/gpio/1
  // Match the request
  if (req.indexOf("/gpio/0") != -1)
  {
    digitalWrite(2, HIGH);//off
    x=1;
  }
  else if (req.indexOf("/gpio/1") != -1)
  {
    digitalWrite(2, LOW);//on
    x=0;
  }
  else {
    Serial.println("invalid request");
    client.stop();
    return;
  }

  // Set GPIO2 according to the request
  
  
  client.flush();

    String convertableLocalIp = WiFi.localIP().toString().c_str();
    String url0 = "/gpio/0";
    String url1 = "/gpio/1";
//    String toggleUrl = x== 1 ? '/gpio/1' : x == 0? '/gpio/0': '';

Serial.println(x);
    

  // Prepare the response
  String s = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n<!DOCTYPE HTML>\r\n<html> <button onclick='toggle()'>Toggle</button> <button onclick='on0()'>gpio0</button> <button onclick='on1()'>gpio1</button>  \r\nGPIO is now <script> function on0(){location.replace(\""+url0+"\")} function on1(){location.replace(\""+url1+"\")} function toggle(){location.replace(\""+x+"\"== 1 ? '/gpio/1' : \""+x+"\" == 0? '/gpio/0': '')} </script> ";
  s += (x)?"high":"low";
  s += "</html>\n";

  // Send the response to the client
  client.print(s);
    Serial.println(s);
  delay(1);
  Serial.println("Client disonnected");

  // The client will actually be disconnected 
  // when the function returns and 'client' object is detroyed
}
