Note: this docker container does not understand bash or sudo commands or systemctl.

On first run complete the following steps:

```bash
docker pull leggant/teamb:1.0
```

to rebuild the image:
```bash
docker build -t leggant/teamb:1.0 .
```

run a single disposible container:
```bash
docker run -it --rm -p 8080:8080 leggant/teamb:1.0
```