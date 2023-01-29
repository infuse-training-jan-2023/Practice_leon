docker build -t leon/reactfront  .
docker kill ae870bf6f03d
docker run  -p 3000:3000 leon/reactfront
docker-compose version 
docker -v 
docker version  
docker compose up
docker compose down
docker ps
docker images
docker run leon/reactfront
docker system prune