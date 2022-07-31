FROM openjdk:8
EXPOSE 8080
ADD target/devopsproj.jar devopsproj.jar
ENTRYPOINT ["java","-jar","/devopsproj.jar"]