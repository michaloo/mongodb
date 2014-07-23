FROM ubuntu:14.04

WORKDIR /root
ENV HOME /root

# install mongodb
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    sudo \
    curl \
    mongodb-org && \
    apt-get clean

# install templater
RUN cd /usr/local/bin && curl -L https://github.com/michaloo/templater/releases/download/v0.0.1/templater.tar.gz | \
    tar -xzv

# add scripts
ADD ./bin    /app/bin

# add config files
ADD ./config /app/config

EXPOSE 27017


ENV MONGODB_DBPATH /data/db

VOLUME ["/data/db"]

ENTRYPOINT ["/app/bin/before_mongod"]

CMD []
