#!/bin/bash
# Get a list of all running container IDs
container_ids=$(docker ps -q)
# Check if there are any running containers
if [ -z "$container_ids" ]; then
  echo "No running containers to stop."
  exit 0
fi
# Loop through each container ID and stop it
for container_id in $container_ids; do
  docker stop $container_id
  echo "Container $container_id stopped."
done
echo "All running containers have been stopped."
