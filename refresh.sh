docker rmi $(docker images -q -f dangling=true); docker rm $(docker ps -a -q); docker kill $(docker ps -q); docker-compose down; docker-compose build; docker-compose up -d;
