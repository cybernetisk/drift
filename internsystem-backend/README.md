# Setup of internsystem

This is the setup for running https://github.com/cybernetisk/internsystem
in production.

It runs a container with Gunicorn running the actual application.

Environment setup is set with file overrides and environment variables
passed to the container. The different environments are stored in the
`environments` directory.

## Deploying a version

Our CI normally deploys the latest version automatically.

A list of available versions:
https://hub.docker.com/r/cybernetisk/in-backend/tags/

Deploying a version:

`ENV=test ./deploy.sh 20181023-2214-995`

It will migrate the database and run the container.

You must provide secret key to Django installation and password to
Postgres-database. The keys will be stored in plain text files in the
same directory for later use.

The static files are saved to the Docker-volume
`internsystem-backend-static` that is also mounted in the nginx-container.
