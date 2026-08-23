## Docker compose file location 
Stored at `.config/docker/<name>/`

## Start Docker compose file
`docker compose -f /path/to/your/compose.yaml up -d`

## Mount drive info
- Bind mounts: stored at relative path (under `~/.config/docker/container_name/`), check the compose file for the folder name.
- Docker volume: Mounted volumes can be checked through: `sudo docker volume ls`
By specify the volume name, the mounted path can be checked by: `sudo docker volume inspect <volume name>`

## Update container
```
docker pull <image_name>:<tag>
docker compose <path> up -d #this will recreate the container
```

## Load environmental secret variable for the continer
Stored at `./.env`, not commited to git repo

## Docker specification
- [open-webui](https://github.com/open-webui/open-webui/blob/main/docker-compose.yaml):
    - bind-mounted folder name: `./open-webui-data` 
    - tranfer from pip (Python package manager): 
        1. stop the program; 
        2. remove all `webui*` file in the bind-mounted location/ volume (default usually are `/var/lib/docker/volumes/open-webui_open-webui/_data/https://us-west.tybruce.com:9443/
`), check with `ls`  
        3. copy from environment, e.g.: `~/miniconda3/envs/services/lib/python3.12/site-packages/open_webui/data/` 
        4. paste into mounted location 

- [core-keeper](https://github.com/escapingnetwork/core-keeper-dedicated):
    - bind-mounted folder name: `./core-keeper-dedicated`, `./core-keeper-data`
    - query the game ID: `docker exec -it core-keeper-dedicated cat /home/steam/core-keeper-dedicated/GameID.txt`
    - Modified argument: `WORLD_NAME`, `DISCORD_WEBHOOK_URL`
    - .env file (required): `PASSWORD`; (optional: ) `DISCORD_WEBHOOK_URL`

- [palworld](https://github.com/thijsvanloef/palworld-server-docker):
    - bind-mounted folder name: `./palworld`  
    - .env file variables (required): `SERVER_NAME`, `SERVER_PASSWORD`, `ADMIN_PASSWORD`; (optional:) `DISCORD_WEBHOOK_URL`
