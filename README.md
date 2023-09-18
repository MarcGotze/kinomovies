# Install

## Requirements

- Node.js 18
- Ruby 3.1.2
- PostgreSQL 14.8

## Run
### Go to /back folder
```bash
# Install packages
bundle install

# First time only
# Init database
rails db:create

# Init migrations
rails db:migrate

# Feed the database
rails db:seed
# End First time only

# Launch backend server
rails s
```

### Go to /front folder
Create a .env file at the root of the /front folder, then add :
>VITE_TMDB_KEY=USE_YOUR_TMDB_API_KEY

>VITE_API_BACK_USERS=http://localhost:3000/
```bash
# Install packages
npm install

# Launch frontend server
npm run dev
```



# Install with Docker

## Requirements

- Docker

## Run
In the docker-compose.yml file :
>VITE_TMDB_KEY=USE_YOUR_TMDB_API_KEY
```bash
docker compose build

# First time only
docker compose run back rake db:reset
docker compose run back rake db:migrate
# End First time only

# Launch the project
docker compose up -d

# close the project
docker compose down
```
