# z-backend

See https://github.com/cybrairai/z-backend for more details.

## Set up and updating

Make sure the files `cyb/reports.json` and `uglebo/reports.json` are
created before starting the containers.

- `touch cyb/reports.json`
- `touch uglebo/reports.json`

Update sources, (re)build Docker image and start containers:

- `./update-source.sh`
- `docker-compose build`
- `docker-compose up -d`
