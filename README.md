# TheMoarYouBe
This project was born in Hackathon SmartCities http://www.global.datafest.net/

TheMoarYouBe is a massive open online course (MOOC) intended as a non profit platform. Our goal is provides the best digital experience between the students and teachers because our focus is online collaboration and teamwork.

It's for individuals who want to quickly build sleek tutorials — for example, a teacher who builds an assignment for his students, or a musician who builds a short course on music theory and posts it on his or her blog. Or organizations looking to start experimenting with online courses without having to install anything.

#### Our Challenges:
* Be a solid reference in online education.
* Create a platform easy to use for students and teachers.
* Split large learning routes into small parts - for example, 
the learning route: "The Rails Ninja" will be divided into HTML, CSS, and Ruby courses.

### Future features:
* Forum or discussion functionality. 
* Real time assessment.
* Build learning routes with existing small courses created by users.
* Achievements system.

### Technical background:
This project is developed in Ruby on rails, also it contains the following libraries and tools:
* Docker
* AdminLTE template

### How to run it with Docker using docker-compose tool

0. Install [Docker](http://docs.docker.com/installation/ubuntulinux/) 
1. Install [docker-compose](http://docs.docker.com/compose/install/)
2. Clone this repo
3. ```cd /path/to/TheMoarYouBe```
4. ```docker-compose build``` this command will download needed docker image for your web container
5. ```docker-compose up``` this command will download all dependent containers described in docker-compose yml, link them and run
6. In other terminal run ```cd /path/to/TheMoarYouBe && docker-compose run web bundle exec rake db:create db:migrate db:seed```
7. Go to ```http://localhost:8084``` and make sure that your project is running successfully 
8. ```ctrl+c``` in previous terminal after that
9. ```docker-compose start``` to run your project
10. Check the ```http://localhost:8084``` url for working project again
11. Stop it with ```docker-compose stop```

The default user is: admin@admin.com/admin1234

### Notes
Do not forget to run Docker service without sudo after installation and before running ```docker-compose build```:

* Add the docker group if it doesn't already exist.
```sudo groupadd docker```
* Add the connected user "${USERNAME}" to the docker group.
```sudo gpasswd -a ${USERNAME} docker```
* Restart the docker daemon (if your Linux distro uses systemd)
```sudo systemctl restart docker```

### Support

Please file issues [click here] at Github. 

Copyright (c) 2015 Rosalila Studio. This software is licensed under the GPL License.

Good luck!

[click here]:https://github.com/Rosalila/TheMoarYouBe/issues

### Fork it

* Create your feature branch (git checkout -b my-new-feature)
* Commit your changes (git commit -am 'Add some feature')
* Push to the branch (git push origin my-new-feature)
- Create a new Pull Request
