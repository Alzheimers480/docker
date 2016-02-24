FROM php:5.6-apache
MAINTAINER David Keller <dnkeller@oakland.edu>
RUN docker-php-ext-install mysqli
COPY config/php.ini /usr/local/etc/php/
COPY src/ /var/www/html/
RUN apt-get update && apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y
RUN cd ~ && git clone https://github.com/Itseez/opencv.git && git clone https://github.com/itseez/opencv_contrib
RUN cd ~ && mkdir opencv/release/ && cd opencv/release/ && cmake -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF .. && make -j7 && make install
COPY facerec/ /root/facerec
RUN apt-get install unzip -y && cd /root/facerec/ && ldconfig && ln -snf /dev/null /dev/raw1394 && chmod +x build && ./build && unzip testdata.zip && chmod +x create_csv.py && ./create_csv.py testdata/model > my.csv
# RUN cd /root/facerec && chmod +x build && cd /root/facerec && ldconfig && ln /dev/null /dev/raw1394 && ./build