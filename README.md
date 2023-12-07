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
4. `docker network create intranet`
5. `docker volume create registry_data`
6. `docker compose up -d`
