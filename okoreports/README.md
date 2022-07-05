# okoreports

See https://github.com/cybernetisk/okotools/tree/master/tripletexweb for more
details.

## Setup and updating

The file `.env` must exist having the required envs defined.
See link above for more details.

In addition the `credentials.json` should hold credentials to
a Google Cloud Service Account that is used to fetch budget data.

```
docker-compose pull
docker-compose up -d
```
