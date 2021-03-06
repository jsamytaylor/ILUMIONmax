ifeq '$(ARCH)' 'Raspberry Pi'

OBJECTS_fpp_co_rpi_ws281x_so += channeloutput/rpi_ws281x.o
LIBS_fpp_co_rpi_ws281x_so=-L../external/rpi_ws281x/ -lws2811  -L. -lfpp -ljsoncpp

CXXFLAGS_channeloutput/rpi_ws281x.o=-I../external/rpi_ws281x/include/

TARGETS += libfpp-co-RPIWS281X.$(SHLIB_EXT)
OBJECTS_ALL+=$(OBJECTS_fpp_co_rpi_ws281x_so)

libfpp-co-RPIWS281X.$(SHLIB_EXT): $(OBJECTS_fpp_co_rpi_ws281x_so)  ../external/rpi_ws281x/libws2811.a libfpp.$(SHLIB_EXT)
	$(CCACHE) $(CC) -shared $(CFLAGS_$@) $(OBJECTS_fpp_co_rpi_ws281x_so) $(LIBS_fpp_co_rpi_ws281x_so) $(LDFLAGS) $(LDFLAGS_fpp_co_rpi_ws281x_so) -o $@

endif
