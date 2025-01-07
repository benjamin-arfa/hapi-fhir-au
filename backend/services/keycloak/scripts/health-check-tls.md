
https://stackoverflow.com/questions/53301299/add-healthcheck-in-keycloak-docker-swarm-service

healthcheck:
  test: ["CMD", "bash", "-c", "[ $(/opt/keycloak/bin/kcadm.sh get serverinfo --realm YOURREALM --fields '*' --server http://localhost:8080/auth/admin/serverinfo 2>&1 | grep Unauthorized | wc -l ) -eq 1 ]"]
  interval: 10s
  timeout: 20s
  retries: 20
  start_period: 10s
