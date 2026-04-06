![marketing_assets_banner](https://github.com/user-attachments/assets/b8b4ae5c-06bb-46a7-8d94-903a04595036)
[![GitHub License](https://img.shields.io/github/license/indifferentbroccoli/humanitz-server-docker?style=for-the-badge&color=6aa84f)](https://github.com/indifferentbroccoli/humanitz-server-docker/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/indifferentbroccoli/humanitz-server-docker?style=for-the-badge&color=6aa84f)](https://github.com/indifferentbroccoli/humanitz-server-docker/releases)
[![GitHub Repo stars](https://img.shields.io/github/stars/indifferentbroccoli/humanitz-server-docker?style=for-the-badge&color=6aa84f)](https://github.com/indifferentbroccoli/humanitz-server-docker)
[![Discord](https://img.shields.io/discord/798321161082896395?style=for-the-badge&label=Discord&labelColor=5865F2&color=6aa84f)](https://discord.gg/indifferentbroccoli)
[![Docker Pulls](https://img.shields.io/docker/pulls/indifferentbroccoli/humanitz-server-docker?style=for-the-badge&color=6aa84f)](https://hub.docker.com/r/indifferentbroccoli/humanitz-server-docker)

Game server hosting

Fast RAM, high-speed internet

Eat lag for breakfast

[Try our HumanitZ server hosting free for 2 days!](https://indifferentbroccoli.com/humanitz-server-hosting)

## HumanitZ Dedicated Server Docker

A Docker container for running a HumanitZ dedicated server using DepotDownloader.

## Server Requirements

| Resource | Minimum  | Recommended |
|----------|----------|-------------|
| CPU      | 2 cores  | 4+ cores    |
| RAM      | 4GB      | 8GB         |
| Storage  | 10GB     | 20GB        |

## How to use

Copy the `.env.example` file to a new file called `.env`. Then use either `docker compose` or `docker run`.

### Docker Compose

```yaml
services:
  humanitz:
    image: indifferentbroccoli/humanitz-server-docker
    restart: unless-stopped
    container_name: humanitz
    stop_grace_period: 30s
    ports:
      - 7777:7777/udp
      - 27015:27015/udp
    env_file:
      - .env
    volumes:
      - ./server-files:/home/steam/server-files
```

Then run:

```bash
docker compose up -d
```

### Docker Run

```bash
docker run -d \
    --restart unless-stopped \
    --name humanitz \
    --stop-timeout 30 \
    -p 7777:7777/udp \
    -p 27015:27015/udp \
    --env-file .env \
    -v ./server-files:/home/steam/server-files \
    indifferentbroccoli/humanitz-server-docker
```

## Environment Variables

| Variable        | Default         | Info |
|-----------------|-----------------|------|
| PUID            | 1000            | User ID for file permissions |
| PGID            | 1000            | Group ID for file permissions |
| UPDATE_ON_START | true            | Set to `false` to skip downloading and validating server files on startup |
| PORT            | 7777            | UDP port the server listens on |
| QUERY_PORT      | 27015           | UDP port for Steam server browser queries |
| SERVER_NAME     | HumanitZ Server | Display name of the server in the server browser |
| SERVER_PASSWORD |                 | Password required to join. Leave empty for a public server |
| MAX_PLAYERS     | 16              | Maximum number of players allowed |

> [!NOTE]
> All other game settings (loot, zombies, PVP, etc.) are configured directly in `server-files/HumanitZServer/GameServerSettings.ini` after the first run.

## Port Forwarding

Forward these ports through your firewall/router:

| Port  | Protocol | Purpose                  |
|-------|----------|--------------------------|
| 7777  | UDP      | Game traffic             |
| 27015 | UDP      | Steam server browser     |

See [portforward.com](https://portforward.com) for router-specific guides.

## Volumes

- `/home/steam/server-files` — Server installation files, saves, and configuration
