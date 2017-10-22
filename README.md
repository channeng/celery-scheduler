# Celery Scheduler

A Docker implementation of Celery running on Flask, managed with supervisord.

## Overview

This is a scheduler application powered by [Celery](http://docs.celeryproject.org/en/latest/index.html) running on a minimal python web framework, [Flask](http://flask.pocoo.org/).

The application is process-managed by [Supervisord](http://supervisord.org/) which takes care of managing celery task workers, celerybeat and Redis as the message broker.

The deployment of the application is handled through [Docker](https://www.docker.com/what-docker) which isolates the application environment. It allows the application to run the same, whether locally, in staging or when deployed within a server.

## Running this setup

You may choose to run this setup with or without Docker.

Deployment with Docker is recommended for consistency of application environment.

[With Docker]

1. Install Docker
	- [Mac or Windows](https://docs.docker.com/engine/installation/)
	- [Ubuntu server](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)
		- To install docker in Ubuntu, you may run the install script:
		```bash
		sudo bash scripts/startup/ubuntu_docker_setup.sh
		```
2. Build docker image
	```bash
	mkdir 
	git archive --remote=git@github.com:channeng/celery-scheduler.git HEAD Dockerfile
	sudo docker build -t celery-scheduler .
	```
3. Run supervisord
	```bash
	sudo docker run -p 3020:80 -d celery-scheduler /usr/bin/supervisord --nodaemon
	```

[Without Docker]
1. Clone the repository:
```bash
git clone 
```
## Contributing
Feel free to submit Pull Requests.
For any other enquiries, you may contact me at channeng@gmail.com.



- If successfully deployed, supervisor logs should display:
```bash
2017-10-13 01:10:24,838 INFO success: redis entered RUNNING state, process has stayed up for > than 10 seconds (startsecs)
2017-10-13 01:10:24,838 INFO success: celerybeat entered RUNNING state, process has stayed up for > than 10 seconds (startsecs)
2017-10-13 01:10:24,838 INFO success: celery entered RUNNING state, process has stayed up for > than 10 seconds (startsecs)
```

### Debugging

- Supervisord logs are stored at `/var/log/supervisord/`
- Celery & Celerybeat logs are stored at `/var/log/celery/`
- Redis logs are stored at `/var/log/redis/`

### Termination

```bash
supervisorctl stop all
```

# Celery

## Adding tasks to Celery

- Task scripts should be written and stored in app/tasks
- Update `celeryconfig.py` for new tasks and trigger times

## Running adhoc tasks

- Update `manage.py` for a manager command for the task to run on trigger
- Run: ```python manage.py <manager_command>```

## Update to apps in Docker -- Rebuild docker image
```bash
docker build -t docker_app </path/to/project_dir>
```
