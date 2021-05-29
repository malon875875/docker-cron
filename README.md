## Setting up a cron in docker

### Build Docker image
docker build -t docker-cron .

### Initiate the container
docker run -d -p 8080:8080 docker-cron

### Test the cron output

- Copy the container id from the output of this command  
docker ps | grep docker-cron

- Login to the docker container using the `container_id`  
docker exec -it <container_id> /bin/bash  
Example: docker exec -it bc8a9bbfbba9 /bin/bash

>Note: Try running above commands using sudo if you get Permission Denied Error.  
`Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.39/containers/json: dial unix /var/run/docker.sock: connect: permission denied`

### Build with docker compose
* docker-compose build
* docker-compose up -d

### Rebuild with docker compose
* change content of files
* docker-compose up -d --build
