# Docker functions and aliases

# Docker shortcut
alias d="docker"

# Docker PS
alias dps="docker ps"

# Docker inspect
alias di="docker inspect"

# Docker images
alias dim="docker images"

# Docker run
alias dr="docker run --rm"

# Run container in daemon mode
alias drd="docker run --rm -d"

# Stop all containers
dstop() { docker stop $* $(docker ps -q -a); }

# Remove all containers
drm() { docker rm $* $(docker ps -q -a); }

# Remove all images
dri() { docker rmi $* $(docker images -q); }

# Shell login to container
dsh() { docker exec -i -t $1 /bin/bash; }

# Docker build
db() { docker build -t="$1" .; }
