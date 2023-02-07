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


Q1 -> docker build --build-arg val1=3 --build-arg val2=4 -t leon/addnum .
      docker run leon/addnum

Q2 -> docker build --build-arg val1=6 --build-arg val2=7 -t leon/rubyScript1 .
      docker run leon/rubyScript1

Q3 -> docker build  -t leon/rubytest .
      docker run leon/rubytest

Q4 ->docker build -t leon/exp4
     docker run -p 3000:3000 -t leon/exp4

Q5 ->docker build -t leon/server
     docker run -p 3000:3000 leon/server

Q6 -> 
    docker compose up 
    docker compose down