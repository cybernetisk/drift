# Setup of internsystem

This is the Docker-setup for running https://github.com/cybrairai/internsystem
in production.

The main purpose of this Docker setup is to build static files that is served
by nginx. There is no container that will persist for this setup.

## Building static files

Run `./update.sh` that will perform all needed operations.

The build itself is stored in Docker volume `internsystem-frontend-build`
that is used by nginx.
