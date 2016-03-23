# kill all running containers then remove dangling images
docker kill $(docker ps -q);
#docker rmi -f $(docker images -q -f dangling=true);

# restart the server
docker-compose down && docker-compose build && docker-compose up -d;

# show if the server is up
docker ps;
