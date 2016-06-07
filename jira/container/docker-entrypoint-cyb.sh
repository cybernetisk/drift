#!/bin/bash

# ideas taken from https://github.com/cptactionhank/docker-atlassian-jira-software/blob/master/docker-entrypoint.sh

# check if the `server.xml` file has been changed since the creation of this
# Docker image. If the file has been changed the entrypoint script will not
# perform modifications to the configuration file.
if [ "$(stat --format "%Y" "${JIRA_INSTALL}/conf/server.xml")" -eq "0" ]; then
  if [ -n "${X_CROWD_PASSWORD}" ]; then
    sed "s/PASSWORD_TO_BE_REPLACED/${X_CROWD_PASSWORD}/" "${JIRA_INSTALL}/atlassian-jira/WEB-INF/classes/crowd.properties" >/tmp/crowd.properties
    cat /tmp/crowd.properties >"${JIRA_INSTALL}/atlassian-jira/WEB-INF/classes/crowd.properties"
    rm /tmp/crowd.properties

    xmlstarlet ed --inplace  --update "//authenticator/@class" -v "com.atlassian.jira.security.login.SSOSeraphAuthenticator" "${JIRA_INSTALL}/atlassian-jira/WEB-INF/classes/seraph-config.xml"
  fi
fi

# pass the command to the next entrypoint
. /docker-entrypoint.sh
