#include <ESP8266WiFi.h>
#include <PubSubClient.h>

const char* ssid ="myhome"; //replace this with your wifi  name
const char* password ="xxxxxxxxx"; //replace with your wifi password
char hostname[] ="192.168.1.112"; //replace this with IP address of machine 
//on which broker is installed
#define TOKEN "bytesofgigabytes"

WiFiClient wifiClient;
PubSubClient client(wifiClient);

int status = WL_IDLE_STATUS;
int con=0;
void setup()
{
Serial.begin(115200);
WiFi.begin(ssid, password);

while (WiFi.status() != WL_CONNECTED) {
delay(500);
Serial.print(".");
}
Serial.println("Connected to WiFi");
Serial.println("ESP8266 AS PUBLISHER");
client.setServer(hostname, 1883 ); //default port for mqtt is 1883
}

void loop()
{
if ( !client.connected() )
{
reconnect();
}
MQTTPOST();
delay(5000);//delay 5 Sec
}

void MQTTPOST()
{
//payload formation begins here
String payload ="{";
payload +="\"Temp\":"; payload +=con++; payload +=",";
payload +="\"Humi\":"; payload +=30;
payload +="}";

char attributes[1000];
payload.toCharArray( attributes, 1000 );
client.publish("test", attributes); //topic="test" MQTT data post command.
Serial.println( attributes );
}
//this function helps you reconnect wifi as well as broker if connection gets disconnected.
void reconnect() 
{
while (!client.connected()) {
status = WiFi.status();
if ( status != WL_CONNECTED) {
WiFi.begin(ssid, password);
while (WiFi.status() != WL_CONNECTED) {
delay(500);
Serial.print(".");
}
Serial.println("Connected to AP");
}
Serial.print("Connecting to Broker …");
Serial.print("192.168.43.220");

if ( client.connect("ESP8266 Device", TOKEN, NULL) )
{
Serial.println("[DONE]" );
}
else {
Serial.println( " : retrying in 5 seconds]" );
delay( 5000 );
}
}
}
