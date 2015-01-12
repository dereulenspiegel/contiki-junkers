CONTIKI_PROJECT = junkers-server
all: junkers-server

CONTIKI=/Users/till/Development/sd/git-repos/contiki

UIP_CONF_IPV6=1
WITH_COAP=1

PROJECT_SOURCEFILES += heater.c

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"

ifeq ($(WITH_COAP), 1)
CFLAGS += -DWITH_COAP
APPS += rest-coap
else
CFLAGS += -DWITH_HTTP
APPS += rest-http
endif

MODULES += core/net/ipv6 core/net/ipv4  core/net/ip core/net/mac core/net core/net/rpl core/net/mac/sicslowmac core/net/mac/contikimac core/net/llsec

CONTIKI_WITH_IPV6 = 1
include $(CONTIKI)/Makefile.include