FROM ubuntu:xenial

ENV CONFIGURL "https://raw.githubusercontent.com/apefrei/butterlan-gameserver-configs/main/chivalry/PCServer-UDKGame.ini"
SHELL ["/bin/bash", "-c"]

################################################################################
## exposing 8000 and 27015 on udp
EXPOSE 8000:8000/udp
EXPOSE 27015:27015/udp

################################################################################
## app deps
RUN set -x && \
    dpkg --add-architecture i386 && \
    apt-get update -qq && \
    apt-get install -qq curl libstdc++6:i386 libgcc1

################################################################################
## cleaning as root
RUN apt-get clean autoclean purge && \
    rm -fr /tmp/*

RUN useradd -r -m -u 1000 steam

################################################################################
## copy run script
COPY run.sh /opt/chivalry/run
## download config from URL
RUN curl ${CONFIGURL} --output /opt/chivalry/config/PCServer-UDKGame.ini

################################################################################
## volume
RUN mkdir -p /opt/chivalry/config \
    && mkdir -p /opt/chivalry/run \
    && chown root -R /opt/chivalry \
    && chmod 755 -R /opt/chivalry

################################################################################
## app run
USER root
ENTRYPOINT exec /opt/chivalry/run/run.sh
