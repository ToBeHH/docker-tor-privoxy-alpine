# tor-privoxy-alpine

A tor image, much inspired by the [Freedom box](https://wiki.debian.org/FreedomBox/Configs/Tor)

```
docker run -d -p 8118:8118 -p 9050:9050 -v torsettings:/root/.tor tobehh/docker-tor-privoxy-dns
curl --proxy localhost:8118 https://check.torproject.org/api/ip
```



