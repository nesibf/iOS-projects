#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include "DHT.h"

#define DHTPIN 5
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);

const int pin = 16;
MDNSResponder mdns;
const char* ssid = "";
const char* password = "";

ESP8266WebServer server(80);
String webPage = "";

void setup(void) {
  // put your setup code here, to run once:
  dht.begin();
  Serial.begin(115200);
  pinMode(pin, OUTPUT);
  digitalWrite(pin, LOW);
  WiFi.begin(ssid, password);
  Serial.println("");
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());

  if (mdns.begin("esp8266", WiFi.localIP())) {
    Serial.println("MDNS Responder started.");
  }

  server.on("/ledon", []{
    digitalWrite(pin, HIGH);
    webPage = "LED is now on.";
    server.send(200, "text/html", webPage);
    delay(1);
  });
  server.on("/ledoff", []{
    digitalWrite(pin, LOW);
    webPage = "LED is now off.";
    server.send(200, "text/html", webPage);
    delay(1);
  });

  server.on("/read", [](){
    float temp = dht.readTemperature();
    float hum = dht.readHumidity();
    char resulttemp[14] = "";
    char resulthum[14] = "";
    dtostrf(temp, 0, 1, resulttemp);
    dtostrf(hum, 0, 1, resulthum);
    webPage = "Temperature: ";
    webPage += resulttemp;
    webPage += "  Humidity: ";
    webPage += resulthum;
    server.send(200, "text/html", webPage);
    delay(1);
  });
  server.on("/", []{
    server.send(200, "text/html", "Welcome to the Smart Home! Type in /read to read the temperature, type in /ledon to turn on the lamp, and type in /ledoff to turn off the lamp.");
    delay(1);
  });

  server.begin();
}

void loop(void) {
  // put your main code here, to run repeatedly:
  server.handleClient();
}
