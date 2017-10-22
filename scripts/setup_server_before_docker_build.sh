#!/bin/bash

# From local, run:
# scp Dockerfile ubuntu@server_address:/home/ubuntu

sudo docker build -t celery-scheduler .
sudo docker run -p 3020:80 -d celery-scheduler /usr/bin/supervisord --nodaemon
# sudo docker stop $(sudo docker ps -f ancestor=celery-scheduler --format "{{.ID}}")
