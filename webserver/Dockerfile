FROM php:5.6-apache
MAINTAINER David Keller <dnkeller@oakland.edu>
RUN docker-php-ext-install mysqli

# OpenCV install
RUN apt-get update && apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y
RUN cd ~ && git clone https://github.com/Itseez/opencv.git && git clone https://github.com/itseez/opencv_contrib
RUN cd ~ && mkdir opencv/release/ && cd opencv/release/ && cmake -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF .. && make -j7 && make install

# Build my openCV cpp code
COPY facerec/ /root/facerec
RUN apt-get install unzip -y && cd /root/facerec/ && ldconfig && chmod +x build && ./build && unzip testdata.zip && chmod +x create_csv.py && ./create_csv.py testdata/model > my.csv

# Fix for the ln command by modifying apache2-foreground
COPY config/apache2-foreground /usr/local/bin/apache2-foreground
RUN chmod +x /usr/local/bin/apache2-foreground

# server code
COPY config/php.ini /usr/local/etc/php/
COPY src/ /var/www/html/

# From master
RUN mkdir /var/www/html/facePics
RUN chmod -R 777 /var
