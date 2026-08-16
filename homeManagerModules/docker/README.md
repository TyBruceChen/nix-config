## Docker compose file location 
Stored at `.config/docker/<name>/`

## Start Docker compose file
`docker compose -f /path/to/your/compose.yaml up -d`

## Mount drive info
Mounted volumes can be checked through: `sudo docker volume ls`
By specify the volume name, the mounted path can be checked by: `sudo docker volume inspect <volume name>`

## 

## Docker specification
- open-webui: 
    - to tranfer from pip (Python package manager): 
        1. stop the program; 
        2. remove all `webui*` file in the mounted location (default usually are `/var/lib/docker/volumes/open-webui_open-webui/_data/https://us-west.tybruce.com:9443/
`), check with `ls`  
        3. copy from environment, e.g.: `~/miniconda3/envs/services/lib/python3.12/site-packages/open_webui/data/` 3. paste into mounted location 
