FROM ubuntu:18.04

USER root
ADD ./package.json .
ADD ./index.js .
SHELL ["/bin/bash", "--login", "-c"]
RUN ln -sf /bin/bash /bin/sh
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN apt install mosquitto mosquitto-clients -y
ENV NVM_DIR /root/.nvm 
ENV NODE_VERSION 16.14.2
RUN apt update
RUN apt install curl -y
RUN apt install build-essential libssl-dev -y
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install express --save
RUN npm install -g pm2

RUN pm2 startup

RUN pm2 save

CMD pm2-runtime start index.js 3 
