#!/bin/bash

rm -f files/files.hash
docker rmi spark-shell:0.9.1
for i in `find . -type f | sed s/"\.\/"//`; do git hash-object $i | tr -d '\n'; echo -e "\t$i"; done > /tmp/files.hash
mv /tmp/files.hash files/files.hash
sudo docker build --no-cache -t spark-shell:0.9.1 .
