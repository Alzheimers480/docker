#remove old cv machine
docker-machine stop cv
docker-machine rm cv -y

#create new machine
docker-machine create --driver virtualbox --virtualbox-disk-size 50000 --virtualbox-memory 4096 --virtualbox-cpu-count 2 cv
