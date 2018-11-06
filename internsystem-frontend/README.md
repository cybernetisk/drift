# Setup of internsystem-frontend

This is the setup to deploy a prebuilt package of the frontend project
https://github.com/cybernetisk/internsystem-frontend

Travis CI builds the artifact, uploads it to a server holding this setup
and executing `deploy.sh`.

This will cause the artifact to be decompressed and replace existing static
files that nginx uses to serve clients.
