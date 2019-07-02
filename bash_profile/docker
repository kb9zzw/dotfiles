# Docker functions and aliases

# Docker shortcut
alias d="docker"

# Docker PS
alias dps="docker ps"

# Docker inspect
alias din="docker inspect"

# Docker images
alias dim="docker images"

# Docker run
alias drun="docker run --rm"

# Docker run in daemon mode
alias drund="docker run --rm -d"

# Docker stop
alias dstop="docker stop"

# Docker rm
alias drm="docker rm"

# Docker rmi
alias drmi="docker rmi"

# Docker logs
alias dlogs="docker logs"

# Docker stat
alias dstats="docker stats"

# Docker build
alias dbuild="docker build"

# Docker exec
alias dexec="docker exec"

# Docker volume
alias dvol="docker volume"

# Stop all containers
dstopall() { docker stop $* $(docker ps -q -a); }

# Remove all containers
drmall() { docker rm $* $(docker ps -q -a); }

# Remove all images
drmiall() { docker rmi $* $(docker images -q); }

# Cleanup 
dclean() { 
  docker rm $(docker ps -q -a -f status=exited)
  docker volume rm $(docker volume ls -qf dangling=true)
}

# Reclaim everything
dprune() { docker system prune -af; }

# Shell login to container
dsh() { docker exec -i -t $1 /bin/bash; }

