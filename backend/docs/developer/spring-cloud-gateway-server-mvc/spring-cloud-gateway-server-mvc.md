<h1 align="center">Spring Cloud Gateway Server MVC</h1>

## Build Management

### Set up the Development Environment

You need to set up your development environment before you can do anything.

What you need:

* git
* JDK 17 or later
* Maven 3.9.9 or later

### Development

The build supports the following Maven project profiles: dev and test.

To build the application:

```
# In the project's /backend/modules/spring-cloud-gateway-server-mvc directory

mvn clean install spring-boot:repackage

# or

mvn clean install -DskipTests=true spring-boot:repackage

# or

mvn clean install -Pdev spring-boot:repackage
mvn clean install -Ptest spring-boot:repackage
```

**Note:** `dev` is the active by default profile.

Check the Spring Boot Actuator health endpoint:

```
http://localhost:8080/actuator/health
```

You should receive a JSON-formatted message saying {"status":"UP"} which indicates that everything is working fine. 

To stop the server (Ctrl+c).