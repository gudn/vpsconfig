This is my one host VPS configuration for personal projects. It uses traefik as
reverse proxy and docker-compose for configuration description.

If you want use this configuration you must also provide some additional files:
- `.env` file with DOMAIN and EMAIL (for ACME) variables
- `users/admin` htdigest file for access to traefik dashboard
- `users/registry` htpasswd file to access to registry
