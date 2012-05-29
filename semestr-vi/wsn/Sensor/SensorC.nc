#include <Timer.h>
#include "../packet.h"
#include "../neighbourhood.h"

// count of messages which will be sent when node enters the network
#define WELCOME_COUNT 5

module SensorC {
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
    uses interface Read<uint16_t> as Photo;  // interface for reading the senssor
    uses interface Read<uint16_t> as Temp;

}

implementation {


    message_t pkt;

    bool busy = FALSE;
    bool connected = FALSE;
    bool which = FALSE;
    bool sent_data = FALSE;

    uint32_t msgs_sent = 0;
    uint32_t msgs_received = 0;
    uint16_t distance_to_base = 0xff;

    uint16_t photo_counter = 0;
    uint16_t temp_counter = 0;

    uint16_t PhotoTab[255];
    uint16_t TempTab[255];

    int buildRouting = 0;

    Neighbourhood_t neighbourhood[10];
    uint16_t nearbyNode = 0;


    // Function headers
    void SendRefreshRouting();
    void GetResultHandler(Packet_t * recpkt);
    void NodePositionHandler(Packet_t * recpkt);
    void RefreshRoutingHandler(Packet_t * recpkt);
    void ResendDataHandler(Packet_t * recpkt);
    void ShowNeighbourhoodHandler(Packet_t * recpkt);


    // Events
    event void Boot.booted() {
        call AMControl.start();
    }

    event void AMControl.startDone(error_t err) {
        if (err == SUCCESS) {
            call Timer0.startPeriodic(4000);
            call Timer1.startPeriodic(10000);
            call Timer2.startPeriodic(30000);
        } else {
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

    event void Timer0.fired() {
        if(!connected) {
            SendRefreshRouting();
        } else {
            if (which && sent_data) {
                CmdSendData_t cmd;
                cmd.type = DATA_HEAT;
                cmd.value = TempTab[temp_counter--];
                send(TOS_NODE_ID, nearbyNode, 0, CMD_SEND_DATA, &cmd);
                which = FALSE;
                sent_data = FALSE;
                temp_counter = 0;
            } else if (!which && sent_data) {
                CmdSendData_t cmd;
                cmd.type = DATA_LIGHT;
                cmd.value = PhotoTab[photo_counter--];
                send(TOS_NODE_ID, nearbyNode, 0, CMD_SEND_DATA, &cmd);
                which = TRUE;
                sent_data = FALSE;
            }
        }

    }

    event void Timer1.fired() {
        if(which) 
            call Temp.read();
        else
            call Photo.read();
    }

    event void Timer2.fired(){
        // call Leds.led2Toggle();
        // connected = FALSE;
        /* SendRefreshRouting(); */
    }

    event void AMSend.sendDone(message_t* msg, error_t err) {
        if (&pkt == msg) {
            busy = FALSE;
        }
    }

    event void Temp.readDone(error_t result, uint16_t data) {
        if(temp_counter >= 255) temp_counter = 0;
        TempTab[temp_counter] = data;
        temp_counter++;
        sent_data = TRUE;
    }

    event void Photo.readDone(error_t result, uint16_t data) {
        if(photo_counter >= 255) photo_counter = 0;
        PhotoTab[photo_counter] = data;
        photo_counter++;
        sent_data = TRUE;
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

            switch(recpkt->cmdId){
                case CMD_NODE_POSITION:
                    NodePositionHandler(recpkt);
                    break;

                case CMD_GET_RESULT:
                    GetResultHandler(recpkt);
                    break;

                case CMD_REFRESH_ROUTING:
                    RefreshRoutingHandler(recpkt);
                    break;

                case CMD_SEND_DATA:
                    ResendDataHandler(recpkt);
                    break;

                case CMD_SHOW_NEIGHBOURHOOD:
                    ShowNeighbourhoodHandler(recpkt);
                    break;

                case CMD_RENEW_ROUTING:
                    connected = FALSE;
                    break;

            }
        }

        return msg;
    }


    // Helper functions
    void SendRefreshRouting(){
        int i;
        // Clear routing table
        distance_to_base = 0xff;
        for(i=1; i<10; i++){
            neighbourhood[i].distance_to_base = 0;
        }

        call Leds.led1Toggle();
        send(TOS_NODE_ID, 0xFFFF, 0, CMD_REFRESH_ROUTING, NULL);
    }

    //Handler for commands
    //CMD_RECEIVE_RESULT
    void GetResultHandler(Packet_t * recpkt){
        CmdReceiveResult_t cmd;

        cmd.distanceToBase = distance_to_base;
        cmd.msgsSent = msgs_sent;
        cmd.msgsReceived = msgs_received;

        send(TOS_NODE_ID, recpkt->srcAddr, 0, CMD_RECEIVE_RESULT, &cmd);
    }

    //Update data for CMD_NODE_POSITION
    void NodePositionHandler(Packet_t * recpkt){
        CmdNodePosition_t cmd;
        cmd = recpkt->data.cmdNodePosition;

        // call Leds.led2Toggle();
        neighbourhood[recpkt->srcAddr].distance_to_base = cmd.distanceToBase;

        if(cmd.distanceToBase + 1 < distance_to_base){
            distance_to_base = cmd.distanceToBase + 1;
            nearbyNode = recpkt->srcAddr;
        }

        connected = TRUE;
        call Leds.led0Toggle();
    }


    void RefreshRoutingHandler(Packet_t * recpkt){
        CmdNodePosition_t cmd;
        cmd.distanceToBase = distance_to_base;
        send(TOS_NODE_ID, recpkt->srcAddr, 0, CMD_NODE_POSITION, &cmd);
    }

    //Forward data if message is not for me
    void ResendDataHandler(Packet_t * recpkt){
        CmdSendData_t cmd;
        call Leds.led2Toggle();
        cmd = recpkt->data.cmdSendData;
        send(recpkt->srcAddr, nearbyNode, recpkt->seqNo, CMD_SEND_DATA, &cmd);
    }

    void ShowNeighbourhoodHandler(Packet_t * recpkt){
        CmdNeighbourhood_t cmd;
        int i;

        cmd.distance[0] = distance_to_base;
        for(i=1; i<10; i++){
            cmd.distance[i] = neighbourhood[i].distance_to_base;
        }

        send(TOS_NODE_ID, recpkt->srcAddr, 0, CMD_NEIGHBOURHOOD, &cmd);
    }

}

// vim: ft=c et ts=4 sts=4 sw=4

