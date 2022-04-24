Note: this docker container does not understand bash or sudo commands or systemctl.

On first run complete the following steps:

```bash
docker pull leggant/teamb:1.0
```
to rebuild the image:
```bash
docker build -t leggant/teamb:1.0 .
```
run a single disposible container for testing:
```bash
docker run -it --name teamb--rm leggant/teamb:1.0
```
```bash
# with the container running, run the following in a separate terminal
docker exec -it teamb /bin/sh
## then run the script
sh ./team_b_scripts/puppetmaster.sh
```

## Docker Compose To Come........