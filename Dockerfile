# Jenkins.

FROM debian:jessie
MAINTAINER Matteo La Cognata <matteo@voxbox.io>
ENV     GIT_SSL_NO_VERIFY=1

ENV     APP sipdump
ENV     HOME /var/log/$APP

ARG DEVICE
ENV DEVICE ${DEVICE:-eth0}

# 0- PREREQUISITES
RUN apt-get update && apt-get install -y \
  dh-autoreconf \
  sudo \
  curl \
  wget \
  git \  
  libpcap-dev

# 1- GET SIPDUMP
WORKDIR /usr/src
RUN git clone https://github.com/voxbox-io/sipdump

# 2- COMPILE SIPDUMP
WORKDIR sipdump
RUN cc pcapsipdump.cpp calltable.cpp -lpcap -lstdc++ -o pcapsipdump
      
# 3- RUN SIPDUMP    
CMD /usr/bin/pcapsipdump -f -U -R none -p -i ${DEVICE} -d sipdump-data