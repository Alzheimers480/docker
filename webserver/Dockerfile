FROM php:5.6-apache
MAINTAINER David Keller <dnkeller@oakland.edu>
RUN docker-php-ext-install mysqli

# OpenCV install
RUN apt-get update && apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y
RUN cd ~ && git clone https://github.com/Itseez/opencv.git && git clone https://github.com/itseez/opencv_contrib
RUN cd ~ && mkdir opencv/release/ && cd opencv/release/ && cmake -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF .. && make -j7 && make install

# Fix for the ln command by modifying apache2-foreground
COPY config/apache2-foreground /usr/local/bin/apache2-foreground
RUN chmod +x /usr/local/bin/apache2-foreground

# Build my openCV cpp code
RUN apt-get install unzip vim -y
COPY facerec/ /var/www/facerec
RUN cd /var/www/facerec/ && ldconfig && chmod +x build && sync && ./build && chmod +x create_csv.py
RUN chmod 777 /var/www/ && chmod 777 -R /var/www/facerec
RUN chown www-data:www-data /var/www -R

# server code
COPY config/php.ini /usr/local/etc/php/
COPY src/ /var/www/html/

# From master
RUN mkdir /var/www/html/facePics
RUN chmod -R 777 /var
RUN apt-get update && apt-get -y install mailutils
RUN apt-get -y install expect
COPY config/emailConfig.sh /
RUN cd /
RUN chmod 777 /emailConfig.sh
RUN /emailConfig.sh
RUN service exim4 restart
