#ifndef NEIGHBOURHOOD_H
#define NEIGHBOURHOOD_H

#define COUNT_RSSI(rssi) ((rssi) > 0 ? (-91 + (3 * ((rssi) - 1))) : -126)

typedef struct {
	uint8_t node_id;
	int node_rssi;
	uint8_t node_lqi;
	uint8_t distance_to_base;
} Neighbourhood_t;

#endif
