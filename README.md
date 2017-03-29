# klient-container
Dockerfile for building Kodings kite klient agent.

### Build
```
$ cd klient-container
$ docker build -t koding/klient .
```

### Run
```
$ # Get a one-time token from Koding website so klient can connect.
$ export TOKEN=...
$ docker run --name klient -d -p 56789:56789 -e TOKEN=${TOKEN} koding/klient
```
