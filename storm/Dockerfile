ARG version
FROM 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/base:$version
MAINTAINER jikeapp

RUN wget -q -O - https://archive.apache.org/dist/storm/apache-storm-0.9.7/apache-storm-0.9.7.tar.gz | tar -xzf - -C /opt

ENV STORM_HOME /opt/apache-storm-0.9.7

RUN groupadd storm; \
    useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; \
    chown -R storm:storm $STORM_HOME; \
    mkdir /var/log/storm ; \
    chown -R storm:storm /var/log/storm; \
    ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
