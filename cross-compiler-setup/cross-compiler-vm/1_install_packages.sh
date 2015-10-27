#! /bin/bash
su
apt-get install sudo
adduser pi sudo
apt-get install pkg-config make build-essential cifs-utils avahi-daemon avahi-utils libavahi-compat-libdnssd-dev 
rm /etc/sudoers
cp sudoers /etc/sudoers






