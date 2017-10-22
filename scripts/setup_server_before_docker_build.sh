#!/bin/bash

# From local, run:
# scp Dockerfile ubuntu@server_address:/home/ubuntu
# scp credentials/* ubuntu@server_address:/home/ubuntu/credentials

sudo docker build -t caramel .
sudo docker run -p 3020:80 -d caramel /usr/bin/supervisord --nodaemon
sudo docker exec -i -t $(sudo docker ps -f ancestor=caramel --format "{{.ID}}") /bin/bash

# sudo docker stop $(sudo docker ps -f ancestor=caramel --format "{{.ID}}")

# Checks
# tail /var/log/redis/redis.log
# tail /var/log/celery/beat.log
# tail /var/log/celery/worker.log
# tail /var/log/supervisor/supervisord.log
# source /home/ubuntu/.virtualenvs/celery_env/bin/activate
# python manage.py send_email
