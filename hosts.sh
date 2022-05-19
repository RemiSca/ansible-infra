#!/bin/bash --

HOSTS_FILE=ansible/hosts
rm ${HOSTS_FILE}

for CONTAINER in $(docker compose ps --quiet); do
    echo ${CONTAINER}
    docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${CONTAINER} >> ${HOSTS_FILE}
done


#docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${CONTAINER}


