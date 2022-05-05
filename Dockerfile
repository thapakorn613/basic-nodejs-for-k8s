FROM node:12.20.1
ARG TIMEZONE="Asia/Bangkok"
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone
RUN apt update && apt install sshpass
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN npm install
EXPOSE 3000
CMD [ "node", "index.js" ]