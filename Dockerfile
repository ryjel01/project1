FROM ubuntu:latest 
LABEL maintainer="ubuntu OS" 

RUN mkdir /code
WORKDIR /code

ENV PORT 80
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --assume-yes git && \
    apt-get install --assume-yes vim
