
authentik

cd /Users/rob/workspace/Robinyo/fhir/hapi-fhir-au/backend/services/authentik

https://docs.goauthentik.io/docs/install-config/install/docker-compose

curl -O https://goauthentik.io/docker-compose.yml

echo "PG_PASS=$(openssl rand -base64 36 | tr -d '\n')" >> .env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 60 | tr -d '\n')" >> .env

.env
PG_PASS=guH0ry0OcHkJYYjrltiO9M1JYpLZTtd5Sjhqbo+VUxSA+okx
AUTHENTIK_SECRET_KEY=488EcK46KECtYIRKM/S8+/Jc/rb8fCXn+PKiiqaSFZOm0wcwJz7JcQhXt18GuETADemXzkoT2ur7dPG3

http://localhost:9000/if/flow/initial-setup/

email: admin@hapi-fhir.au
password: secret

docker compose -f docker-compose-authentik.yml up
docker compose -f docker-compose-authentik.yml stop
docker compose -f docker-compose-authentik.yml down
docker volume rm backend_postgres_data
docker volume rm backend_cache

docker system prune

--

OAuth2 Proxy Provider
implicit

oauth2-proxy
FOyVOgnUOtlJcpAlWccPMUaboi13a8ikJ3g70lxiyRMrZsIk9ueGavlscGRSpZBS4VKwPAhN1da8sYm43MCrX9tbYHFvKM8A7lbmqnzaz2lzvYccHZxy17QV3G3tZMjJ

http://localhost:4180/oauth2/callback

Hide applications
blank://blank
To hide an application without modifying its policy settings or removing it, you can simply set the Launch URL to blank://blank, which will hide the application from users.

authentik Warning: authentik Domain is not configured, authentication will not work.

--

authentik oauth2 proxy

https://docs.goauthentik.io/docs/add-secure-apps/providers/oauth2/

OAuth2 Proxy authentik config

--

https://blog.cubieserver.de/2023/auth-proxy-with-authentik-and-traefik/

https://github.com/brokenscripts/authentik_traefik

authentik health check

--

server-1      | {"error":"websocket: bad handshake","event":"failed to connect websocket","level":"warning","logger":"authentik.outpost.ak-api-controller","timestamp":"2024-12-31T04:37:18Z"}

--

oauth2-proxy  | [2024/12/31 04:36:45] [proxy.go:89] mapping path "/" => upstream "http://hapi-fhir"
oauth2-proxy  | [2024/12/31 04:36:45] [oauthproxy.go:172] OAuthProxy configured for OpenID Connect Client ID: oauth2-proxy
oauth2-proxy  | [2024/12/31 04:36:45] [oauthproxy.go:178] Cookie settings: name:oauth2-proxy secure(https):false httponly:true expiry:10m0s domains: path:/ samesite: refresh:after 5m0s

--

oauth2-proxy  | [2024/12/31 04:38:11] [oauthproxy.go:1024] No valid authentication in request. Initiating login.
oauth2-proxy  | 172.18.0.1:56570 - cd6ece4c-7cef-4e04-8b72-262f10218653 - - [2024/12/31 04:38:11] localhost:4180 GET - "/" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 403 8488 0.027
oauth2-proxy  | [2024/12/31 04:38:11] [oauthproxy.go:1024] No valid authentication in request. Initiating login.
oauth2-proxy  | 172.18.0.1:56586 - 508f71bc-0194-4602-9f28-467249354ed5 - - [2024/12/31 04:38:11] localhost:4180 GET - "/" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 403 8488 0.001
oauth2-proxy  | 172.18.0.1:56586 - aa28a88c-76ec-450c-b8d2-7a7b4cfb95cf - - [2024/12/31 04:38:11] localhost:4180 GET - "/oauth2/static/css/bulma.min.css" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 200 207302 0.011
oauth2-proxy  | [2024/12/31 04:38:11] [oauthproxy.go:1024] No valid authentication in request. Initiating login.
oauth2-proxy  | 172.18.0.1:56586 - 7efc7461-9a4e-4687-af80-9db9f735bb18 - - [2024/12/31 04:38:11] localhost:4180 GET - "/favicon.ico" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 403 8499 0.000
oauth2-proxy  | 172.18.0.1:61256 - bb9aef4f-4c75-4372-be59-01d39b0aa72a - - [2024/12/31 04:38:21] localhost:4180 GET - "/oauth2/start?rd=%2F" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 302 299 0.003
server-1      | {"action": "authorize_application", "auth_via": "session", "client_ip": "172.18.0.1", "context": {"authorized_application": {"app": "authentik_core", "model_name": "application", "name": "OAuth2 Proxy", "pk": "2d6ac4c73f0241a588ae6b89edb4b662"}, "flow": "b258ea160dfc47e0b6c5e865cdd8664a", "http_request": {"args": {"approval_prompt": "force", "client_id": "oauth2-proxy", "redirect_uri": "http://localhost:4180/oauth2/callback", "response_type": "code", "scope": "email openid profile", "state": "EzEL8DIIHzUuSa-PIbWL3inl4EIFzbaY8ach7QIJ9n4:/"}, "method": "GET", "path": "/application/o/authorize/", "request_id": "1950b5ec98f14c29ab1a36d7af11ce65", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"}, "scopes": "openid email profile"}, "domain_url": "localhost", "event": "Created Event", "host": "localhost:9000", "level": "info", "logger": "authentik.events.models", "pid": 56, "request_id": "1950b5ec98f14c29ab1a36d7af11ce65", "schema_name": "public", "timestamp": "2024-12-31T04:38:22.148365", "user": {"email": "hey@rob-ferguson.me", "pk": 4, "username": "akadmin"}}
server-1      | {"auth_via": "session", "domain_url": "localhost", "event": "Task published", "host": "localhost:9000", "level": "info", "logger": "authentik.root.celery", "pid": 56, "request_id": "1950b5ec98f14c29ab1a36d7af11ce65", "schema_name": "public", "task_id": "c41ea06c9c9e41939f058d9611aa87b8", "task_name": "authentik.events.tasks.event_notification_handler", "timestamp": "2024-12-31T04:38:22.253535"}
server-1      | {"auth_via": "session", "domain_url": "localhost", "event": "/application/o/authorize/?approval_prompt=force&client_id=oauth2-proxy&redirect_uri=http%3A%2F%2Flocalhost%3A4180%2Foauth2%2Fcallback&response_type=code&scope=email+openid+profile&state=EzEL8DIIHzUuSa-PIbWL3inl4EIFzbaY8ach7QIJ9n4%3A%2F", "host": "localhost:9000", "level": "info", "logger": "authentik.asgi", "method": "GET", "pid": 56, "remote": "172.18.0.1", "request_id": "1950b5ec98f14c29ab1a36d7af11ce65", "runtime": 226, "schema_name": "public", "scheme": "http", "status": 302, "timestamp": "2024-12-31T04:38:22.267338", "user": "akadmin", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"}
worker-1      | {"domain_url": null, "event": "Task started", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "task_id": "c41ea06c-9c9e-4193-9f05-8d9611aa87b8", "task_name": "event_notification_handler", "timestamp": "2024-12-31T04:38:22.270517"}
oauth2-proxy  | [2024/12/31 04:38:22] [oauthproxy.go:895] Error redeeming code during OAuth2 callback: token exchange failed: Post "http://localhost:9000/application/o/token/": dial tcp [::1]:9000: connect: connection refused
oauth2-proxy  | 172.18.0.1:61256 - 396f76cd-059e-4db9-a313-31e459711370 - - [2024/12/31 04:38:22] localhost:4180 GET - "/oauth2/callback?code=c4a38db7df8d4f09a32b7d7dd0e3c543&state=EzEL8DIIHzUuSa-PIbWL3inl4EIFzbaY8ach7QIJ9n4%3A%2F" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 500 2771 0.009
oauth2-proxy  | 172.18.0.1:61256 - 7ed4f61c-073f-4830-a970-4f080ad3072b - - [2024/12/31 04:38:22] localhost:4180 GET - "/oauth2/static/css/bulma.min.css" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 200 207302 0.004
oauth2-proxy  | 172.18.0.1:61270 - 3da6be1a-0886-4bbf-a45b-1d318212660c - - [2024/12/31 04:38:22] localhost:4180 GET - "/oauth2/static/css/all.min.css" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 200 102025 0.003
worker-1      | {"domain_url": null, "event": "Task published", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "task_id": "6fa4a96a652f433a9bbae538f363f6e7", "task_name": "authentik.events.tasks.event_trigger_handler", "timestamp": "2024-12-31T04:38:22.336839"}
worker-1      | {"domain_url": null, "event": "Task published", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "task_id": "f699901ddcb24db2939fb6818170fa95", "task_name": "authentik.events.tasks.event_trigger_handler", "timestamp": "2024-12-31T04:38:22.341983"}
worker-1      | {"domain_url": null, "event": "Task published", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "task_id": "88b23d766fdd4727972f0c0d027122f8", "task_name": "authentik.events.tasks.event_trigger_handler", "timestamp": "2024-12-31T04:38:22.349630"}
worker-1      | {"domain_url": null, "event": "Task finished", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "state": "SUCCESS", "task_id": "c41ea06c9c9e41939f058d9611aa87b8", "task_name": "event_notification_handler", "timestamp": "2024-12-31T04:38:22.363573"}
oauth2-proxy  | 172.18.0.1:61270 - 52efc6f4-4dff-427f-b7ea-a34f4f096bc8 - - [2024/12/31 04:38:22] localhost:4180 GET - "/oauth2/static/webfonts/fa-solid-900.woff2" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 200 149908 0.012
oauth2-proxy  | [2024/12/31 04:38:22] [oauthproxy.go:1024] No valid authentication in request. Initiating login.
oauth2-proxy  | 172.18.0.1:61270 - c1e0b00b-ed71-4f62-9973-794e977f9003 - - [2024/12/31 04:38:22] localhost:4180 GET - "/favicon.ico" HTTP/1.1 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" 403 8499 0.000
worker-1      | {"domain_url": null, "event": "Task started", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "task_id": "6fa4a96a-652f-433a-9bba-e538f363f6e7", "task_name": "event_trigger_handler", "timestamp": "2024-12-31T04:38:22.900803"}
worker-1      | {"domain_url": null, "event": "Task finished", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "state": "SUCCESS", "task_id": "6fa4a96a652f433a9bbae538f363f6e7", "task_name": "event_trigger_handler", "timestamp": "2024-12-31T04:38:22.941085"}
worker-1      | {"domain_url": null, "event": "Task started", "level": "info", "logger": "authentik.root.celery", "pid": 107, "schema_name": "public", "task_id": "f699901d-dcb2-4db2-939f-b6818170fa95", "task_name": "event_trigger_handler", "timestamp": "2024-12-31T04:38:22.948624"}
worker-1      | {"domain_url": null, "event": "Task started", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "task_id": "88b23d76-6fdd-4727-972f-0c0d027122f8", "task_name": "event_trigger_handler", "timestamp": "2024-12-31T04:38:22.950836"}
worker-1      | {"domain_url": null, "event": "Task finished", "level": "info", "logger": "authentik.root.celery", "pid": 63, "schema_name": "public", "state": "SUCCESS", "task_id": "88b23d766fdd4727972f0c0d027122f8", "task_name": "event_trigger_handler", "timestamp": "2024-12-31T04:38:22.986304"}
worker-1      | {"domain_url": null, "event": "Task finished", "level": "info", "logger": "authentik.root.celery", "pid": 107, "schema_name": "public", "state": "SUCCESS", "task_id": "f699901ddcb24db2939fb6818170fa95", "task_name": "event_trigger_handler", "timestamp": "2024-12-31T04:38:22.991897"}
worker-1      | {"event": "TenantAwareScheduler: Sending due task user_cleanup (authentik.core.tasks.clean_temporary_users) to 1 tenants", "level": "info", "logger": "tenant_schemas_celery.scheduler", "timestamp": 1735619940.0446312}
worker-1      | {"domain_url": null, "event": "Task published", "level": "info", "logger": "authentik.root.celery", "pid": 57, "schema_name": "public", "task_id": "f7765f52edd2416ba9906d291116453b", "task_name": "authentik.core.tasks.clean_temporary_users", "timestamp": "2024-12-31T04:39:00.059504"}
worker-1      | {"domain_url": null, "event": "Task started", "level": "info", "logger": "authentik.root.celery", "pid": 107, "schema_name": "public", "task_id": "f7765f52-edd2-416b-a990-6d291116453b", "task_name": "clean_temporary_users", "timestamp": "2024-12-31T04:39:00.078526"}
worker-1      | {"domain_url": null, "event": "Task finished", "level": "info", "logger": "authentik.root.celery", "pid": 107, "schema_name": "public", "state": "SUCCESS", "task_id": "f7765f52edd2416ba9906d291116453b", "task_name": "clean_temporary_users", "timestamp": "2024-12-31T04:39:00.120948"}


