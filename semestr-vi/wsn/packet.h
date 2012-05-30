#ifndef PACKET_H
#define PACKET_H

#define DATA_LENGTH 20

// IDs of commands
enum {
    CMD_CHECK_IN    =   0x01,
    CMD_GET_RESULT = 0x02,
    CMD_RECEIVE_RESULT = 0x03,
    CMD_REFRESH_ROUTING = 0x04,
    CMD_NODE_POSITION = 0x05,
    CMD_SEND_DATA = 0x06,
    CMD_SHOW_NEIGHBOURHOOD = 0x07,
    CMD_NEIGHBOURHOOD = 0x08,
    CMD_BASE = 0x09,
    CMD_RENEW_ROUTING = 0x0A

	// CMD_RESPONSE   = 0x80,
	// CMD_HEARTBEAT  = 0x00,
	// CMD_HELLO		= 0x01,
	// CMD_RHELLO		= CMD_HELLO | CMD_RESPONSE
};

enum {
    DATA_LIGHT,
    DATA_HEAT
};

typedef nx_struct {
    nx_uint16_t value;
    nx_uint8_t type;
} CmdSendData_t;

typedef nx_struct {
    nx_uint8_t distance[10];
} CmdNeighbourhood_t;

typedef nx_struct {
    nx_uint16_t distanceToBase;
} CmdNodePosition_t;

typedef nx_struct {
    nx_uint16_t msgsSent;
    nx_uint16_t msgsReceived;
    nx_uint16_t distanceToBase;
} CmdReceiveResult_t;

typedef nx_union {
    CmdNodePosition_t cmdNodePosition;
    CmdReceiveResult_t cmdReceiveResult;
    CmdSendData_t cmdSendData;
    CmdNeighbourhood_t cmdNeighbourhood;
    nx_uint8_t data[DATA_LENGTH];
} PacketData_t;

typedef nx_struct {
    nx_uint16_t dstAddr;        // ID of a destination node
    nx_uint16_t srcAddr;        // ID of source node that send the message
    nx_uint16_t sender;         // physical sender of message
    nx_uint8_t seqNo;          // sequence number of each message originating from a srcAddr node
    nx_uint8_t cmdId;
    PacketData_t data;
} Packet_t;




#endif
