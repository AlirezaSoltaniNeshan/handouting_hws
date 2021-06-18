#include <ESP8266WiFi.h>
#include <WiFiUdp.h>

const char* ssid = "sofa" ;
const char* password = "AL20re/*";

WiFiUDP Udp;
unsigned int localUdpPort = 4210;  // local port to listen on
char incomingPacket[255];  // buffer for incoming packets
char  replyPacket[] = "Hi there! Got the message :-)";  // a reply string to send back


void setup()
{
  Serial.begin(115200);
  Serial.println();

  Serial.printf("Connecting to %s ", ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.println(" connected");
  Udp.begin(localUdpPort);
  Serial.printf("Now listening at IP %s, UDP port %d\n", WiFi.localIP().toString().c_str(), localUdpPort);
}


void loop()
{
  int packetSize = Udp.parsePacket();
  if (packetSize)
  {
    // receive incoming UDP packets
//    Serial.printf("Received %d bytes from %s, port %d\n", packetSize, Udp.remoteIP().toString().c_str(), Udp.remotePort());
    int len = Udp.read(incomingPacket, 255);
    
    if (len > 0)
    {
      incomingPacket[len] = 0;
    }
    Serial.println(incomingPacket[5]);   
      
    char turnOnChar [255] = "turnOn";
    char turnOffChar [255] = "turnOff";

    Serial.println(incomingPacket);
    
    if (incomingPacket[5] == turnOnChar[5]) {
      digitalWrite(LED_BUILTIN, LOW);
      Serial.println("THE =>>> Turn On LED");
    } else if (incomingPacket[5] == turnOffChar[5]) {
      digitalWrite(LED_BUILTIN, HIGH);
      Serial.println("THE =>>> Turn off LED");
    }
//    Serial.printf("UDP packet contents: %s\n", incomingPacket);

    // send back a reply, to the IP address and port we got the packet from
    Udp.beginPacket(Udp.remoteIP(), Udp.remotePort());
    Udp.write(replyPacket);
    
    Udp.endPacket();
  }
}
