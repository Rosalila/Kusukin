# HackathonSmartCities
Hackathon SmartCities http://www.global.datafest.net/

##### How to run it with Docker using docker-compose tool

0. Install [Docker](http://docs.docker.com/installation/ubuntulinux/) 
1. Install [docker-compose](http://docs.docker.com/compose/install/)
2. Clone this repo
3. ```cd /path/to/TheMoarYouBe```
4. ```docker-compose build``` this command will download needed docker image for your web container
5. ```docker-compose up``` this command will download all dependent containers described in docker-compose yml, link them and run
6. In other terminal run ```cd /path/to/TheMoarYouBe && docker-compose run web bundle exec rake db:create db:migrate```
7. Go to ```http://localhost:8084``` and make sure that your project is running successfully 
8. ```ctrl+c``` in previous terminal after that
9. ```docker-compose start``` to run your project
10. Check the ```http://localhost:8084``` url for working project again
11. Stop it with ```docker-compose stop```
