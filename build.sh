#!/bin/bash
echo 'Input the password you want to use for VNC below.'
read -p '>>> ' password

# user password in dockerfile
sed -i "s/YOUR-PASSWORD-HERE/$password/g" files/Dockerfile

docker build --tag workspace files/

# remove password from dockerfile
sed -i "s/$password/YOUR-PASSWORD-HERE/g" files/Dockerfile

docker run -it -d --publish 0.0.0.0:5901:5901 \
--cap-add=NET_ADMIN \
--device /dev/net/tun \
--sysctl net.ipv6.conf.all.disable_ipv6=0 \
--name worskspace_container workspace bash

# docker exec -it "$(docker ps -l | grep -Eo '[0-9a-z]{12}')" bash -c '/usr/sbin/vncserver'
