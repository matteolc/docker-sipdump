SIP Tracing Dockerfile
======================

## Running the Container

    docker run -d --privileged -v <VOLUME>:/var/log/sipdump --name sipdump voxbox/sipdump

## Running in Swarm mode

    docker swarm init
    docker stack deploy -c docker-compose.yml sipdump

### Configuration

### Volumes
