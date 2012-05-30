#include <Timer.h>
#include "printf.h"

configuration InspectorAppC {}

implementation {
  components MainC;
  components LedsC;
  components InspectorC as App;
  components new TimerMilliC() as Timer0;
  components new TimerMilliC() as Timer1;
  components new AMSenderC(6);
  components new AMReceiverC(6);
  components RF230ActiveMessageC as ActiveMessageC;
  components SerialActiveMessageC;

  App.Boot -> MainC;
  App.Leds -> LedsC;
  App.Timer0 -> Timer0;
  App.Timer1 -> Timer1;
  App.Packet -> AMSenderC;
  App.AMPacket -> AMSenderC;
  App.AMControl -> ActiveMessageC;
  App.AMSend -> AMSenderC;
  App.Receive -> AMReceiverC;

  App.SerialSend -> SerialActiveMessageC.AMSend[12];
  App.SerialReceive -> SerialActiveMessageC.Receive[12];
  App.SerialControl -> SerialActiveMessageC.SplitControl;
  App.SerialPacket -> SerialActiveMessageC.AMPacket;
}
