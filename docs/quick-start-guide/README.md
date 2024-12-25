## ❯ Quick Start Guide

### Clone the project

Change the current working directory to the location where you want the cloned project to be:

```
cd ~/workspace
```

Clone the project by running the following command:

```
git clone git@github.com:Robinyo/hapi-fhir-au.git
cd ~/workspace/hapi-fhir-au
``` 

### Docker Compose

With a single command, you can create and start all the services:

```
docker compose up
```

Navigate to the **Welcome** page: 

```
http://localhost:8080
```

You should see something like:

<p align="center">
  <img src="./welcome.png" alt="Welcome page"/>
</p>

To stop the services:

```
docker compose stop
```

To remove the services:

```
docker compose down
```

To remove the data volume:

```
docker volume rm backend_postgres_data
```
