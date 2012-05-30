#ifndef BUFOR_H
#define BUFOR_H

#include "packet.h"

typedef struct {
    struct buf_item_t * next;
    Packet_t packet;
} buf_item_t;

typedef struct {
    buf_item_t * head;
    buf_item_t * tail;
} buf_t;


buf_t __inspector__buff__;

bool buf_empty(){
    if(__inspector__buff__.head == NULL) return TRUE;
    else return FALSE;
}

void buf_push(Packet_t * p){
    buf_item_t * it = malloc(sizeof(buf_item_t));
    memcpy(&(it->packet), p, sizeof(Packet_t));
    it->next = NULL;
    if(__inspector__buff__.head == NULL){
        __inspector__buff__.head = __inspector__buff__.tail = it;
    } else {
        __inspector__buff__.tail->next = it;
        __inspector__buff__.tail = it;
    }
}

Packet_t * buf_front(){
    return &(__inspector__buff__.head->packet);
}

void buf_pop(){
    buf_item_t * it;
    if(__inspector__buff__.head != NULL){
        it = __inspector__buff__.head;
        __inspector__buff__.head = it->next;
        free(it);
    }
}

#endif