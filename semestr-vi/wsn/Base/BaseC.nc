#include <Timer.h>
#include "../packet.h"
#include "../neighbourhood.h"
#include "../bufor.h"

module BaseC {
    uses interface Boot;
    uses interface Leds;
    uses interface Timer<TMilli> as Timer0;
    uses interface Timer<TMilli> as Timer1;
    uses interface Timer<TMilli> as Timer2;
    uses interface Packet;
    uses interface AMPacket;
    uses interface AMSend;
    uses interface Receive;
    uses interface SplitControl as AMControl;
    uses interface PacketField<uint8_t> as RadioRSSI;
    uses interface PacketField<uint8_t> as RadioLQI;

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

    CmdReceiveResult_t results[255];
    Neighbourhood_t neighbourhood[10];
    int counter = 0;
    int start = 0;


    void GetResultHandler(Packet_t * recpkt);
    void BaseCommandHandler();
    void RefreshRoutingHandler(Packet_t * recpkt);
    void ShowNeighbourhoodHandler(Packet_t * recpkt);
    void SendDataHandler(Packet_t * recpkt);
    int send(nx_uint16_t srcAddr, nx_uint16_t dstAddr, nx_uint16_t seqNo, nx_uint8_t cmdId, void * data);
    int sendSerialPkt(Packet_t * sp);

// Events

    event void Boot.booted() {
        call AMControl.start();
    }

    event void AMControl.startDone(error_t err) {
        if (err == SUCCESS) {
            call Timer0.startPeriodic(1000);
            call Timer1.startPeriodic(60000);
            call Timer2.startPeriodic(100);
        } else {
            call AMControl.start();
        }
    }

    event void AMControl.stopDone(error_t err) {
    }

    event void Timer0.fired() {
        if(start < 2) {
            BaseCommandHandler();
            start++;
        }
        call Leds.led0Toggle();
    }

    event void Timer1.fired() {
        BaseCommandHandler();
        call Leds.led1Toggle();
    }

    event void Timer2.fired() {
        Packet_t * p;
        if(!serial_busy && !buf_empty()){
            p = buf_front();
            sendSerialPkt(p);
            buf_pop();
            call Leds.led2Toggle();
        }
    }


    event void AMSend.sendDone(message_t* msg, error_t err) {
        if (&pkt == msg) {
            busy = FALSE;
        }
    }


    event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len){
        uint8_t _raw_rssi;
        Packet_t* recpkt;

        recpkt = (Packet_t*) (call Packet.getPayload(msg, sizeof(Packet_t)));

        if (recpkt != NULL) {
            neighbourhood[recpkt->sender].node_id = recpkt->sender;
            _raw_rssi = call RadioRSSI.get(msg);
            neighbourhood[recpkt->sender].node_rssi = COUNT_RSSI(_raw_rssi);
            neighbourhood[recpkt->sender].node_lqi = call RadioLQI.get(msg);
            neighbourhood[recpkt->sender].distance_to_base = 1;

            switch(recpkt->cmdId){
                case CMD_RECEIVE_RESULT :
                    GetResultHandler(recpkt);
                    break;

                case CMD_REFRESH_ROUTING:
                    buf_push(recpkt);
                    RefreshRoutingHandler(recpkt);
                    break;

                case CMD_SHOW_NEIGHBOURHOOD:
                    buf_push(recpkt);
                    ShowNeighbourhoodHandler(recpkt);
                    break;

                case CMD_SEND_DATA:
                    SendDataHandler(recpkt);
                    break;

                default:
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
        call Leds.led1Toggle();

        return msg;
    }

    event void SerialControl.startDone(error_t error) {}
    event void SerialControl.stopDone(error_t error) {}


// Handlers

    void GetResultHandler(Packet_t * recpkt){
        CmdReceiveResult_t cmd;
        cmd = recpkt->data.cmdReceiveResult;
        if(counter >= 255) {
            counter = 0;
        }
        results[counter] = cmd;
        counter++;
    }

    void BaseCommandHandler(){
        send(TOS_NODE_ID, 0xFFFF, 0, CMD_BASE, NULL);
    }

    void RefreshRoutingHandler(Packet_t * recpkt){
        CmdNodePosition_t cmd;
        cmd.distanceToBase = 0;
        send(TOS_NODE_ID, recpkt->srcAddr, 0, CMD_NODE_POSITION, &cmd);
    }

    void ShowNeighbourhoodHandler(Packet_t * recpkt){
        CmdNeighbourhood_t cmd;
        int i;

        cmd.distance[0] = 0;
        for(i=1; i<10; i++){
            cmd.distance[i] =  neighbourhood[i].distance_to_base;
        }

        send(TOS_NODE_ID, recpkt->srcAddr, 0, CMD_NEIGHBOURHOOD, &cmd);
    }

    void SendDataHandler(Packet_t * recpkt){
        buf_push(recpkt);
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

}
