#!/bin/bash

function run {
docker run -d -p 8086:8086 \
	--restart always \
	--name influxdb \
	--volume /home/pi/influxdb/config:/etc/influxdb2 \
	--volume /home/pi/influxdb/data:/var/lib/influxdb2 \
	influxdb:2
}

function attach {
docker exec -it influxdb influx
}

if [[ $# -ne 1 ]]; then
	echo "Usage: docker.sh (run|attach)"
elif [[ $1 == "run" ]]; then
	run
elif [[ $1 == "attach" ]]; then
	attach
fi

