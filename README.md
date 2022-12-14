# Chivalry: "Medieval Warfare" docker

##
This container is a slightly changed version of [thpeng/docker-chivalry-medieval-warfare](https://github.com/thpeng/docker-chivalry-medieval-warfare)

## How 

* create docker volume on host 
* add liberal r/w at least for docker user
* docker build -t apetomate/chivalry-server .
* docker run -ti -v /data/chivalry-server:/opt/chivalry -p 0.0.0.0:8000:8000/udp -p 0.0.0.0:27015:27015/udp --name chivalry-server -t apetomate/chivalry-server

## Features / tested with
* works with mod LSMOD, Blackknight, giantslayers
* most maps (hoth excluded)
* game.ini can be changed reliable
* mods / workshop items can be changed reliable

## known issues
* scripts can be optimized
* no restart if the server has a coredump
