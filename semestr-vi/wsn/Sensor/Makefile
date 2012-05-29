AVRDUDE_CONF=/usr/local/CrossPack-AVR/etc/avrdude.conf
COMPONENT = SensorAppC

# sensors
CFLAGS += -I$(TOSDIR)/sensorboards/mda100/cb
CFLAGS += -I$(TOSDIR)/sensorboards/mda100

# channel and signal strngth
PFLAGS += -DRF230_DEF_CHANNEL=17
# PFLAGS += -DRF230_DEF_RFPOWER=15

include $(MAKERULES)
