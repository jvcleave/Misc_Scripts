#! /bin/bash

cd
curl -O http://192.237.185.151/versions/nightly/of_v20151008_linuxarmv6l_nightly.tar.gz
mkdir openFrameworks
tar vxfz of_v20151008_linuxarmv6l_nightly.tar.gz -C openFrameworks --strip-components 1
cd /home/pi/openFrameworks/scripts/linux/debian
sudo ./install_dependencies.sh