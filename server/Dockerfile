FROM gradle:7.6.1-jdk17
COPY ../.. /home/gradle/src
WORKDIR /home/gradle/src

FROM nginx
COPY ../static/index.html /usr/share/nginx/html/index.html

RUN gradle build
EXPOSE 8080
ENTRYPOINT ["java","-jar","/home/gradle/src/build/libs/ingsis-microservices-0.0.1-SNAPSHOT.jar"]