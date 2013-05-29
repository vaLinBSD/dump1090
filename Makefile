#
# When building a package or installing otherwise in the system, make
# sure that the variable PREFIX is defined, e.g. make PREFIX=/usr/local
#
PROGNAME=dump1090

.if defined(PREFIX)
BINDIR=$(PREFIX)/bin
SHAREDIR=$(PREFIX)/share/$(PROGNAME)
EXTRACFLAGS=-DHTMLPATH=\"$(SHAREDIR)\"
.endif

CFLAGS=-O2 -g -Wall -W -I../rtl-sdr/include
LIBS=-L../rtl-sdr/src/.libs -lrtlsdr -lpthread -lm
CC=gcc


all: dump1090

%.o: %.c
	$(CC) $(CFLAGS) $(EXTRACFLAGS) -c $<

dump1090: dump1090.o anet.o
	$(CC) -g -o dump1090 dump1090.o anet.o $(LIBS)

clean:
	rm -f *.o dump1090
