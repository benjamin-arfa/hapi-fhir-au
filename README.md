<p align="center">
  <img src="./logo.svg" alt="HAPI FHIR AU with Auth Starter Project" width="400"/>
</p>

<h1 align="center">HAPI FHIR AU with Auth Starter Project</h1>

<p align="center">
  <b>A sample HAPI FHIR with Auth Starter Project.</b> <br>
</p>

![divider](./divider.png)

## ❯ Quick Start

### Clone the project

Change the current working directory to the location where you want the cloned project to be:

```
cd ~/workspace
```

Clone the project by running the following command:

```
git clone git@github.com:Robinyo/hapi-fhir-au.git
``` 

### Docker Compose

With a single command, you can create and start all the services:

```
cd ~/workspace/hapi-fhir-au/backend
docker compose up
```

**Note:** Docker Compose will look for a `.env` file in the current working directory.

To navigate to the HAPI FHIR **Welcome** page:

```
http://localhost:4180
```

You should see something like:

<p align="center">
  <img src="./docs/quick-start-guide/hapi-fhir-welcome-page.png" alt="Welcome page"/>
</p>

To navigate to the Keycloak Admin console:

```
http://localhost:5001
```

You should see something like:

<p align="center">
  <img src="./docs/quick-start-guide/keycloak-welcome-page.png" alt="Welcome page"/>
</p>

To stop the services:

```
docker compose stop
```

To remove the services:

```
docker compose down
```

To remove the data volumes:

```
docker volume rm backend_postgres_data
docker volume rm backend_cache
```



### Miscellaneous

#### Export

To export the `hapi-fhir-dev` realm to a single file (development-realm.json):

```
docker compose stop
docker compose -f docker-compose-keycloak-realm-export.yml up
docker compose -f docker-compose-keycloak-realm-export.yml stop
docker compose -f docker-compose-keycloak-realm-export.yml down
docker volume rm backend_postgres_data
docker volume rm backend_cache
```

Check the logs:

```
docker logs --tail 100 oauth2-proxy
docker logs --tail 100 keycloak
```

Clean and build:

```
docker system prune
docker compose build
```

Misc:

```
docker container ps -a
docker image ls
docker volume ls
```

![divider](./divider.png)

## ❯ Resources

* Rob Ferguson's blog: [Getting Started with HAPI FHIR](https://rob-ferguson.me/getting-started-with-hapi-fhir/)
* Rob Ferguson's blog: [HAPI FHIR and FHIR Implementation Guides](https://rob-ferguson.me/hapi-fhir-and-fhir-implementation-guides/)
* Rob Ferguson's blog: [HAPI FHIR and AU Core Test Data](https://rob-ferguson.me/hapi-fhir-and-au-core-test-data/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 1](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-1/)
* Rob Ferguson's blog: [Add AuthN to HAPI FHIR with OAuth2 Proxy, Nginx and Keycloak - Part 2](https://rob-ferguson.me/add-authn-to-hapi-fhir-with-oauth2-proxy-nginx-and-keycloak-part-2/)
