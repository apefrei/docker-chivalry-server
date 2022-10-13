# Chivalry: "Medieval Warfare" docker for the native linux server

## Cookbook 

* create docker volume on host 
* add liberal r/w at least for docker user
* docker build -t apetomate/chivalry-server .
* docker run -ti -v /data/chivalry-server:/opt/chivalry -p 192.168.88.45:8000:8000/udp -p 192.168.88.45:27015:27015/udp --name chivalry-server -t apetomate/chivalry-server

## Features / tested with
* works with mod LSMOD, Blackknight, giantslayers
* most maps (hoth excluded)
* game.ini can be changed reliable
* mods / workshop items can be changed reliable

## known issues
* scripts can be optimized
* no restart if the server has a coredump
