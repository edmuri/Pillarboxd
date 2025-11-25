# Pillarboxd

### Deadlines
- Nov 4th - Title of the project has to be submitted onto the sheet
- Nov 18th - Analysis and ER Diagram + lis tof technologies has to be reported
- Dec 1st - Final Presentation due(3-4 minute recording, ER Diagram, Relational Schema)

### Running the project

Install [docker compose](https://docs.docker.com/compose/install/)

Then run

```bash
docker-compose up -d --build # wait until it downloads everything and starts the containers
docker exec -it rails_web bundle exec rails db:migrate:reset --trace # to create the schema for the db
docker exec -it rails_web bundle exec rails db:seed --trace # seed the database with data
```

The web server and db are already up and running. Database is at localhost:3306 and server is at localhost:3000

### Updating and/or Reseeding the Database
```bash
docker exec -it rails_web bundle exec rails db:reset
```

### Anytime Gemfile or core files are changed...
Core volumes have changed and need to delete cache for new container builds
```bash
docker-compose down --volumes
# Repeat steps above for install
```
