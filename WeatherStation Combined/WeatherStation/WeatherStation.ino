#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h> 
#include <ESP8266mDNS.h>
#include "DHT.h"

#define DHTPIN 5
#define DHTTYPE DHT11

MDNSResponder mdns;

const char* ssid = "Huang Family Network";
const char* password = "SJHH#100f";

ESP8266WebServer server(80);
String webPage = "";
DHT dht(DHTPIN, DHTTYPE);

void setup(void) {
  // put your setup code here, to run once:
  dht.begin();
  delay(1000);
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to: ");
  Serial.println(ssid);
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());

  if (mdns.begin("esp8266", WiFi.localIP())) {
    Serial.println("MDNS responder started. ");
  }

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

  

  server.on("/", [](){
    server.send(200, "text/html", "Welcome to the weather station!");
  });
  server.begin();
  Serial.println("HTTPS Server started. ");
}

void loop(void) {
  // put your main code here, to run repeatedly:
  server.handleClient();
}
