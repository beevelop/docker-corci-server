FROM google/nodejs
MAINTAINER Maik Hummel <yo@beevelop.com>

ENV CORCI_PROTOCOL http

RUN apt-get -qq update && apt-get -qq upgrade -y
RUN apt-get -qq install -y git

RUN npm install -g beevelop/corci-master

CMD corci-master -h 0.0.0.0 -p 8080 -q ${CORCI_PROTOCOL} -l /builds

VOLUME ["/data", "/builds"]
WORKDIR /data

EXPOSE 8080