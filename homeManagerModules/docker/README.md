## Docker Compose files

When `hm.docker.enable = true`, Home Manager installs Docker Compose and links these files:

| Service | Compose file | Bind-mounted data |
| --- | --- | --- |
| Open WebUI | `~/.config/docker/open-webui/docker-compose.yml` | `./open-webui-data` |
| Core Keeper | `~/.config/docker/core-keeper/docker-compose.yml` | `./core-keeper-dedicated`, `./core-keeper-data` |
| Palworld | `~/.config/docker/palworld/docker-compose.yml` | `./palworld` |

Start or update a service with `docker compose -f <path-to-compose-file> up -d`. To pull its image first, run `docker compose -f <path-to-compose-file> pull`.

## Environment variables

Keep secrets in a local `.env` file used by Docker Compose; Home Manager does not create one.

- Core Keeper: `CK_PWD` and `DISCORD_WEBHOOK_URL` are referenced by the Compose file. `WORLD_NAME` is set directly in that file.
- Palworld: `SERVER_NAME`, `SERVER_PASSWORD`, `ADMIN_PASSWORD`, and `DISCORD_WEBHOOK_URL` are referenced by the Compose file.

## Service data

- [Open WebUI](https://github.com/open-webui/open-webui): data is stored in the `open-webui-data` bind mount.
- [Core Keeper](https://github.com/escapingnetwork/core-keeper-dedicated): read the game ID with `docker exec -it core-keeper cat /home/steam/core-keeper-dedicated/GameID.txt`.
- [Palworld](https://github.com/thijsvanloef/palworld-server-docker): data is stored in the `palworld` bind mount.

## Existing Open WebUI data

The current Compose file uses `./open-webui-data`. When migrating an older pip or Docker volume installation, stop Open WebUI and inspect the existing data before copying it into that bind mount. An earlier pip installation may store data under `~/miniconda3/envs/services/lib/python3.12/site-packages/open_webui/data/`. Check older named volumes with `docker volume ls` and `docker volume inspect <volume-name>`. Home Manager does not migrate service data.
