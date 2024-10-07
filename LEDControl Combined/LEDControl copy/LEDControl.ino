#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>

const int pin = 16;
const int pin2 = 5;
const int pin3 = 4;
const int pin4 = 0;
MDNSResponder mdns;
const char* ssid = "Huang Family Network";
const char* password = "SJHH#100";

ESP8266WebServer server(80);
String webPage = "";

void setup(void) {
  // put your setup code here, to run once:
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
    webPage = "LED is now on. ";
    server.send(200, "text/html", webPage);
    delay(1);
  });

  server.on("/ledoff", []{
    digitalWrite(pin, LOW);
    webPage = "LED is now off. ";
    server.send(200, "text/html", webPage);
    delay(1);
  });
  server.on("/", []{
    server.send(200, "text/html", "Hello, this is the webpage");
    delay(1);
  });

  server.begin();
}

void loop(void) {
  // put your main code here, to run repeatedly:
  server.handleClient();
}
