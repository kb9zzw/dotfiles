# Docker functions and aliases

# Docker shortcut
alias d="docker"

# Docker PS
alias dps="docker ps"

# Docker images
alias dim="docker images"

# Run container in daemon mode
drd() { docker run --rm -d -P $*; }

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
