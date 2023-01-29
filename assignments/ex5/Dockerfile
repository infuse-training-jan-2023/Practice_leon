FROM node:latest
WORKDIR /usr/nodeapp/src
ENV port=3001
RUN npm install express
COPY . .
CMD [ "node", "./server.js"]