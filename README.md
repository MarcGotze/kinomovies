# Requirements

- Docker

# Run

```bash
docker compose build

# First time only
docker compose run back rake db:reset 
docker compose run back rake db:migrate
# End First time only

docker compose up -d
```