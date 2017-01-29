# z-backend

See https://github.com/cybrairai/z-backend for more details.

## Set up and updating

Make sure the files `cyb/reports.json` and `uglebo/reports.json` are
created before starting the containers.

- `touch cyb/reports.json`
- `touch uglebo/reports.json`

`./update-source.sh`
`docker-compose build`
`docker-compose up -d`
