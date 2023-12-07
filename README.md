This is my one host VPS configuration for personal projects. It uses traefik as
reverse proxy and docker-compose for configuration description. Commonly, main
feature is support for automatic certificate resolving (thanks to traefik).

If you want use this configuration you must also provide some additional files:
- `.env` file with DOMAIN and EMAIL (for ACME) variables
- `users/admin` htpasswd file for access to traefik dashboard and registry

# Setup
1. Setup docker daemon on target machine
2. Clone this repository
3. Create admin credentials: `docker run --rm -it httpd:alpine -n $(whoami)` and
   put it into `users/admin`
4. Specify `DOMAIN` and `EMAIL` env vars (you can use `.env` file)
5. `docker network create intranet`
6. `docker volume create registry_data`
7. `docker compose up -d`

# Usage
Traefik use docker provider, so you just need pass some labels to setup
redirection. Example from [`docker-compose.yml`](./docker-compose.yml):
```yaml
...
labels:
- "traefik.enable=true"
- "traefik.http.routers.registry.rule=Host(`registry.${DOMAIN}`)"
- "traefik.http.routers.registry.entrypoints=websecure"
...
```

> Note that `DOMAIN` env var may be not accessed from your personal compose
> files

All routers with `websecure` endpoint will get certificate from LetsEncrypt
based on `Host` rules.
