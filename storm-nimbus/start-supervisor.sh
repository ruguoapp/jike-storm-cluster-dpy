#!/usr/bin/env bash
export IP=`hostname -i`
sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$IP/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%hostname%/$HOST_NAME/g" $STORM_HOME/conf/storm.yaml

echo 'storm.zookeeper.root:  "/storm_test"' >> $STORM_HOME/conf/storm.yaml

/usr/sbin/sshd && supervisord
