FROM alpine
MAINTAINER Matteo La Cognata <matteo@voxbox.io>

ENV GIT_SSL_NO_VERIFY=1
ENV APP sipdump
VOLUME /var/log/${APP}

ARG DEVICE
ENV DEVICE ${DEVICE:-eth0}

# 0- PREREQUISITES
RUN apk add --update \
  build-base \
  git \  
  libpcap-dev

# 1- GET SIPDUMP
WORKDIR /usr/src
RUN git clone https://github.com/voxbox-io/${APP}

# 2- COMPILE SIPDUMP
WORKDIR ${APP}
RUN cc pcapsipdump.cpp calltable.cpp -lpcap -lstdc++ -o ${APP}
RUN ln -s /usr/src/${APP}/${APP} /usr/bin/${APP}

# 3- RUN SIPDUMP    
# docker run -d --privileged -v <VOLUME>:/var/log/sipdump --name sipdump voxbox-sipdump
CMD /usr/bin/${APP} -f -U -R none -p -i ${DEVICE} -d /var/log/${APP}