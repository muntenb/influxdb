#!/bin/bash

function run {
docker run -d -p 8086:8086 \
	--restart always \
	--name influxdb_cont \
	--volume /home/pi/influxdb/config/influxdb.conf:/etx/influxdb/influxdb.conf:ro \
	--volume /home/pi/influxdb/data:/var/lib/influxdb \
	influxdb -config /etc/influxdb/influxdb.conf
}

function attach {
docker exec -it influxdb_cont influx
}

if [[ $# -ne 1 ]]; then
	echo "Usage: docker.sh (run|attach)"
elif [[ $1 == "run" ]]; then
	run
elif [[ $1 == "attach" ]]; then
	attach
fi

