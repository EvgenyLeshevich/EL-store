# EL-store | https://el-store-evgeniy.herokuapp.com/

This is an online store where you can view products, add them to your cart, and place an order. You can also register and view your personal profile.

## How to run this?
```bash
$ git clone https://github.com/EvgenyLeshevich/EL-store.git
$ cd EL-store
$ ./mvnw spring-boot:run

//dockerize

$ docker build -t el-store .
$ docker run --name el-store -p 8080:8080 -d el-store

  access http://localhost:8080

Admin account:
  username - admin
  password - admin
```

## Avaliable endpoints

[http://localhost:8080](http://localhost:8080) - home page.

[http://localhost:8080/h2-console](http://localhost:8080/h2-console) - getting to H2 database (username - sa).

## Technological Stack
* Spring boot stack with next starters:
    * web
    * jpa
    * tomcat
    * security
    * mail
    * devtools
    * test
    * validation
* Database H2
* Flyway 
* Project Lombok
* MapStruct
* UI:
    * HTML
    * CSS
    * JS
    * JSP
    * Bootstrap
