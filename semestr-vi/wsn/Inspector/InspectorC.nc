#include <Timer.h>
#include "../packet.h"

#include "../bufor.h"



module InspectorC {
    uses interface Boot;
    uses interface Leds;
    uses interface Timer<TMilli> as Timer0;
    uses interface Timer<TMilli> as Timer1;
    uses interface Packet;
    uses interface AMPacket;
    uses interface AMSend;
    uses interface Receive;
    uses interface SplitControl as AMControl;

    uses interface AMSend as SerialSend;
    uses interface Receive as SerialReceive;
    uses interface SplitControl as SerialControl;
    uses interface AMPacket as SerialPacket;
}

implementation {
    message_t pkt;
    message_t serial_pkt;

    bool busy = FALSE;
    bool serial_busy = FALSE;


    event void Boot.booted() {
        call AMControl.start();
        call SerialControl.start();
        call Timer0.startPeriodic(1000);
        call Timer1.startPeriodic(100);
    }

    event void AMControl.startDone(error_t err) {
        if (err != SUCCESS) {
            call AMControl.start();
        }
    }

    event void AMControl.stopDone(error_t err) {
    }

    int send(nx_uint16_t srcAddr, nx_uint16_t dstAddr, nx_uint16_t seqNo, nx_uint8_t cmdId, void * data){
        Packet_t * p = (Packet_t*)(call Packet.getPayload(&pkt, sizeof(Packet_t)));
        p->sender = TOS_NODE_ID;
        p->srcAddr = srcAddr;
        p->dstAddr = dstAddr;
        p->seqNo = seqNo;
        p->cmdId = cmdId;
        p->data = *((PacketData_t *)data);

        return (call AMSend.send(dstAddr, &pkt, sizeof(Packet_t)));
    }

    int sendSerialPkt(Packet_t * sp){
        Packet_t* p;

        if(serial_busy == TRUE){
            return -1;
        }

        serial_busy = TRUE;

        p = (Packet_t*)(call Packet.getPayload(&serial_pkt, sizeof(Packet_t)));
        p->sender = sp->sender;
        p->srcAddr = sp->srcAddr;
        p->dstAddr = sp->dstAddr;
        p->seqNo = sp->seqNo;
        p->cmdId = sp->cmdId;
        p->data = sp->data;

        return (call SerialSend.send(p->dstAddr, &serial_pkt, sizeof(Packet_t)));
    }

    void SendShowNeighbourhood(){
        send(TOS_NODE_ID, 0xFFFF, 0, CMD_SHOW_NEIGHBOURHOOD, NULL);
    }

    void SendRefreshRouting() {
        send(TOS_NODE_ID, 0xffff, 0, CMD_REFRESH_ROUTING, NULL);
    }

    event void Timer0.fired() {
        call Leds.led0Toggle();
    }

    event void Timer1.fired() {
        Packet_t * p;
        if(!serial_busy && !buf_empty()){
            p = buf_front();
            sendSerialPkt(p);
            buf_pop();
        }
    }

    event void AMSend.sendDone(message_t* msg, error_t err) {
        if (&pkt == msg) {
            busy = FALSE;
        }
    }

    void NeighbourhoodHandler(Packet_t * recpkt){
        buf_push(recpkt);
        // sendSerialPkt(recpkt);
    }

    event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len){
        Packet_t* recpkt;

        recpkt = (Packet_t*) (call Packet.getPayload(msg, sizeof(Packet_t)));

        if (recpkt != NULL) {
            switch(recpkt->cmdId){
                case CMD_NEIGHBOURHOOD:
                    NeighbourhoodHandler(recpkt);
                    break;
            }
        }

        return msg;
    }



    // Serial
    event void SerialSend.sendDone(message_t *msg, error_t error){
        serial_busy = FALSE;
        return;
    }

    event message_t * SerialReceive.receive(message_t *msg, void *payload, uint8_t len){
        Packet_t *recpkt;
        call Leds.led1Toggle();

        recpkt = (Packet_t*) (call Packet.getPayload(msg, sizeof(Packet_t)));
        switch (recpkt->cmdId) {
            case CMD_SHOW_NEIGHBOURHOOD:
                SendShowNeighbourhood();
                break;

            case CMD_RENEW_ROUTING:
                send(TOS_NODE_ID, 0xffff, 0, CMD_RENEW_ROUTING, NULL);
                break;
                
        }

        return msg;
    }

    event void SerialControl.startDone(error_t error) {}
    event void SerialControl.stopDone(error_t error) {}
}

// vim: ft=c

