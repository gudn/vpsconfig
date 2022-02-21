This is my one host VPS configuration for personal projects. It uses traefik as
reverse proxy and docker-compose for configuration description.

If you want use this configuration you must also provide some additional files:
- `.env` file with DOMAIN and EMAIL (for ACME) variables
- `users/admin` htdigest file for access to traefik dashboard
- `users/registry` htpasswd file to access to registry

Also this configuration provide static nginx server by
[lux](github.com/gudn/lux). You can place projects under `/static/projects`
directory. For enable static also add additional docker-compose file and run
like this:

``` sh
docker-compose -f docker-compose.yml -f static/docker-compose.yml
```

Example of `static/docker-compose.yml`:

``` yaml
version: '3'

services:
  static:
    container_name: static
    build: ./static
    networks:
    - intranet
    labels:
    - "traefik.enable=true"
    - "traefik.http.routers.static.rule=Host(`static.example.com`)"
    - "traefik.http.routers.static.entrypoints=websecure"
    - "traefik.http.routers.static.tls.certresolver=leresolver"
```
