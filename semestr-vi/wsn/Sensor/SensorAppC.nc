#include <Timer.h>

configuration SensorAppC {}

implementation {
  components MainC;
  components LedsC;
  components SensorC as App;
  components new TimerMilliC() as Timer0;
  components new TimerMilliC() as Timer1;
  components new TimerMilliC() as Timer2;
  components new AMSenderC(6);
  components new AMReceiverC(6);
  components RF230ActiveMessageC as ActiveMessageC;
  components SerialActiveMessageC;
  components new PhotoC() as Photo;
  components new TempC() as Temp;

  App.Boot -> MainC;
  App.Leds -> LedsC;
  App.Timer0 -> Timer0;
  App.Timer1 -> Timer1;
  App.Timer2 -> Timer2;
  App.Packet -> AMSenderC;
  App.AMPacket -> AMSenderC;
  App.AMControl -> ActiveMessageC;
  App.AMSend -> AMSenderC;
  App.Receive -> AMReceiverC;

  App.RadioRSSI    -> ActiveMessageC.PacketRSSI;
  App.RadioLQI     -> ActiveMessageC.PacketLinkQuality;

  App.Photo -> Photo.Read;
  App.Temp  -> Temp.Read;

}

// vim: ft=c et ts=4 sts=4 sw=4

