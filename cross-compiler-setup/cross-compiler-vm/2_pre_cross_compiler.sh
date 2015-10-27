#! /bin/bash

cd
mkdir /media/Data

echo "//raspberrypi.local/Data /media/Data cifs credentials=/home/pi/.smbcredentials,iocharset=utf8 0 0" >> /etc/fstab
echo -e "username=pi\npassword=raspberry\n" >> /home/pi/.smbcredentials

mount -a

mkdir RPI_ROOT
cd RPI_ROOT
ln -s /media/Data/etc/ etc
ln -s /media/Data/lib/ lib
ln -s /media/Data/opt/ opt

cp -Rv /media/Data/usr/ usr

RPI_VERSION=1

cd
echo -e "export GST_VERSION=1.0\n" >> .profile
echo -e "export RPI_ROOT=/home/pi/RPI_ROOT\n" >> .profile
echo -e "export RPI_TOOLS=/opt/cross/bin\n" >> .profile
echo -e "export TOOLCHAIN_ROOT=/opt/cross/bin\n" >> .profile
echo -e "export PLATFORM_OS=Linux\n" >> .profile
if [ RPI_VERSION == 1 ]
then
	echo -e "export PLATFORM_ARCH=armv6l\n" >> .profile
else
	echo -e "export PLATFORM_ARCH=armv7l\n" >> .profile
	echo -e "export PLATFORM_VARIANT=rpi2\n" >> .profile
fi

echo -e "export PKG_CONFIG_PATH=$RPI_ROOT/usr/lib/arm-linux-gnueabihf/pkgconfig:$RPI_ROOT/usr/share/pkgconfig:$RPI_ROOT/usr/lib/pkgconfig\n" >> .profile

source .profile


cd RPI_ROOT
cd usr/lib/arm-linux-gnueabihf
rm libudev.so libanl.so libBrokenLocale.so libcidn.so libcrypt.so libdbus-1.so libdl.so libexpat.so libglib-2.0.so liblzma.so libm.so libnsl.so libnss_compat.so libnss_dns.so libnss_files.so libnss_hesiod.so libnss_nisplus.so libnss_nis.so libpcre.so libpng12.so.0 libresolv.so libthread_db.so libusb-0.1.so.4 libusb-1.0.so libutil.so libz.so
ln -s ../../../lib/arm-linux-gnueabihf/libanl.so.1  libanl.so        
ln -s ../../../lib/arm-linux-gnueabihf/libBrokenLocale.so.1  libBrokenLocale.so      
ln -s ../../../lib/arm-linux-gnueabihf/libcidn.so.1  libcidn.so        
ln -s ../../../lib/arm-linux-gnueabihf/libcrypt.so.1  libcrypt.so       
ln -s ../../../lib/arm-linux-gnueabihf/libdbus-1.so.3.8.13  libdbus-1.so       
ln -s ../../../lib/arm-linux-gnueabihf/libdl.so.2  libdl.so        
ln -s ../../../lib/arm-linux-gnueabihf/libexpat.so.1.6.0  libexpat.so       
ln -s ../../../lib/arm-linux-gnueabihf/libglib-2.0.so.0  libglib-2.0.so       
ln -s ../../../lib/arm-linux-gnueabihf/liblzma.so.5.0.0  liblzma.so        
ln -s ../../../lib/arm-linux-gnueabihf/libm.so.6  libm.so        
ln -s ../../../lib/arm-linux-gnueabihf/libnsl.so.1  libnsl.so        
ln -s ../../../lib/arm-linux-gnueabihf/libnss_compat.so.2  libnss_compat.so      
ln -s ../../../lib/arm-linux-gnueabihf/libnss_dns.so.2  libnss_dns.so       
ln -s ../../../lib/arm-linux-gnueabihf/libnss_files.so.2  libnss_files.so      
ln -s ../../../lib/arm-linux-gnueabihf/libnss_hesiod.so.2  libnss_hesiod.so      
ln -s ../../../lib/arm-linux-gnueabihf/libnss_nisplus.so.2  libnss_nisplus.so      
ln -s ../../../lib/arm-linux-gnueabihf/libnss_nis.so.2  libnss_nis.so       
ln -s ../../../lib/arm-linux-gnueabihf/libpcre.so.3  libpcre.so        
ln -s ../../../lib/arm-linux-gnueabihf/libpng12.so.0  libpng12.so.0       
ln -s ../../../lib/arm-linux-gnueabihf/libresolv.so.2  libresolv.so       
ln -s ../../../lib/arm-linux-gnueabihf/libthread_db.so.1  libthread_db.so      
ln -s ../../../lib/arm-linux-gnueabihf/libusb-0.1.so.4  libusb-0.1.so.4      
ln -s ../../../lib/arm-linux-gnueabihf/libusb-1.0.so.0.1.0  libusb-1.0.so       
ln -s ../../../lib/arm-linux-gnueabihf/libutil.so.1  libutil.so        
ln -s ../../../lib/arm-linux-gnueabihf/libz.so.1.2.8  libz.so  
ln -s ../../../lib/arm-linux-gnueabihf/libudev.so.1.5.0 libudev.so

cd