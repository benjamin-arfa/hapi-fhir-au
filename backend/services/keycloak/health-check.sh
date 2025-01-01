#!/bin/bash
exec 3<>/dev/tcp/localhost/9000

echo -e "GET /health/ready HTTP/1.1\nhost: localhost:9000\n" >&3

timeout --preserve-status 1 cat <&3 | grep -m 1 status | grep -m 1 UP
ERROR=$?

exec 3<&-
exec 3>&-

exit $ERROR

# chmod +x health-check.sh
# https://www.keycloak.org/server/health
# https://github.com/ubaid4j/api-gateway-with-multiple-oidc-clients
# https://gist.github.com/sarath-soman/5d9aec06953bbd0990c648605d4dba07
# https://stackoverflow.com/questions/75693830/keycloak-v21-docker-container-health-check-failing/78229437#78229437
