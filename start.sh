# Change permissions to rwxrwxrwx (777) for ./InterSystems directory and all its subdirectories
chmod -R 777 ./InterSystems
# Launch containers
docker compose up -d