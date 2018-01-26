# Setup of internsystem

This is the Docker-setup for running https://github.com/cybernetisk/internsystem
in production.

It runs a container with Gunicorn running the actual application.

A image named `cyb/internsystem-backend` will have all pip packages installed
alongside the actual source code. Each change to source code requires
building a new image.

Environment setup is set with file overrides and environment variables
passed to the container. The different environments are stored in the
`environments` directory.

## Initial set up

The setup can be done by running the `update.sh` script with a init parameter:

`ENV=test ./update.sh init`

It will build the image, migrate database and run the container.

You must provide secret key to Django installation and password to Postgres-database.
The keys will be stored in plain text files in the same directory for later use.

The static files are saved to the Docker-volume `internsystem-backend-static` that
is also mounted in the nginx-container.

## Updating

`ENV=test ./update.sh` will take care of the needed updating. See the script for details.
