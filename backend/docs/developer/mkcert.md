<h1 align="center">mkcert</h1>

mkcert is a simple tool for making locally-trusted development certificates. It requires no configuration.

## Build Management

### Create a certificate authority with mkcert

mkcert sets up a locally trusted Certificate Authority (CA), installed into the trust stores on your computer. 
Any certificates issued by this CA will be trusted by the client of your choice (Chrome, Firefox, curl, etc.).

On macOS, you can install mkcert using Homebrew; for other operating systems you can find instructions in the 
[mkcert](https://github.com/FiloSottile/mkcert) docs.

```
brew install mkcert nss
# nss is only needed if you are using Firefox
```

Create and install the certificate authority:

```
mkcert -install
```

You should see something like::

```
Created a new local CA 💥
Sudo password:
The local CA is now installed in the system trust store! ⚡️
The local CA is now installed in the Firefox trust store (requires browser restart)! 🦊
```

Use `mkcert` to generate the certificates Nginx will use:

```
mkcert -key-file key.pem -cert-file cert.pem hapi-fhir.au.localhost
```

Move the files into the \backend\dev-certs directory:

```
.gitignore
cert.pem
key.pem
```

/etc/hosts:

Update your `/etc/hosts` file:

```
sudo nano /etc/hosts
```

Add 'keycloak':

```
127.0.0.1  localhost keycloak hapi-fhir.au.localhost
```

**Note**: Remember that `mkcert` is meant for development purposes, not production, so it should not be used on end 
users' machines, and that you should not export or share `rootCA-key.pem`.

![divider](./divider.png)

## ❯ References

* GitHub: [mkcert](https://github.com/FiloSottile/mkcert)
* okta Developer blog: [Three Ways to Run Your Java Locally with HTTPS](https://developer.okta.com/blog/2022/01/31/local-https-java)