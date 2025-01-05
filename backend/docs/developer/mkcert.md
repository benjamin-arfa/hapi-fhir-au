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

Create and install the certificate authority:

```
Created a new local CA 💥
Sudo password:
The local CA is now installed in the system trust store! ⚡️
The local CA is now installed in the Firefox trust store (requires browser restart)! 🦊
```
