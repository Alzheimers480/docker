docker rmi $(docker images -q -f dangling=true);
docker-compose down; docker-compose build; docker-compose up -d;
