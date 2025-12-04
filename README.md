<img width=1000 height=200 src="./public/icon_full.svg">  

---

<div align="center">

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS](https://img.shields.io/badge/css-%23663399.svg?style=for-the-badge&logo=css&logoColor=white)

</div>

---

<div align="center">
    <img src="./public/Landing.png">
</div>

## What is Pillarboxd?
Pillarboxd is a fullstack application made in Ruby on Rails to showcase complex database relationships amongst video games.  
Our team decided to make a video game reviewing and logging application that can be used to show your friends what games you have been playing!

---

## Running the project

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

## Contributors
[![Bogdan](https://img.shields.io/badge/Bogdan_Catana-FFA500?style=for-the-badge&logo=github&logoColor=white)](https://github.com/bogdicatana)
[![Claudia](https://img.shields.io/badge/Claudia_Varnas-1DB954?style=for-the-badge&logo=github&logoColor=white)](https://github.com/cl-py)
[![Eduardo](https://img.shields.io/badge/Eduardo_Murillo-313030?style=for-the-badge&logo=github&logoColor=white)](https://github.com/edmuri)
[![Martin](https://img.shields.io/badge/Martin_Gawron-53b2c2?style=for-the-badge&logo=github&logoColor=white)](https://github.com/martingaw11)
[![Mauricio](https://img.shields.io/badge/Mauricio_Alvarez-c97d94?style=for-the-badge&logo=github&logoColor=white)](https://github.com/itsperi)
[![Vidhi](https://img.shields.io/badge/Vidhi_Patel-661818?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Vidhi003)
