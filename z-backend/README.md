# z-backend

See https://github.com/cybernetisk/z-backend for more details.

## Set up and updating

Make sure the files `cyb/reports.json` and `uglebo/reports.json` are
created before starting the containers.

- `touch cyb/reports.json`
- `touch uglebo/reports.json`

Pull latest Docker image and start containers:

- `docker-compose pull`
- `docker-compose up -d`
