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
