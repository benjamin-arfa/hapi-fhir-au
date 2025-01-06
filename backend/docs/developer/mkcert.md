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

Use `mkcert` to generate the certificates for the hostname `hapi-fhir.au.localhost`:

```
mkcert -key-file tls.key -cert-file tls.cert hapi-fhir.au.localhost
```

Move the files into the \backend\certs directory:

```
.gitignore
tls.cert
tls.key
```

Set the file permissions:

```
sudo chmod 655 ./certs/*
```

/etc/hosts:

Update your `/etc/hosts` file:

```
sudo nano /etc/hosts
```

Add the hostname:

```
127.0.0.1 localhost hapi-fhir.au.localhost
```

**Note**: Remember that `mkcert` is meant for development purposes, not production, so it should not be used on end 
users' machines, and that you should not export or share `rootCA-key.pem`.

![divider](./divider.png)

## ❯ References

* GitHub: [mkcert](https://github.com/FiloSottile/mkcert)
