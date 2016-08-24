#!/bin/bash

docker run \
    --name cyb-slackbot \
    --net cyb \
    -d --restart=always \
    -e "JIRA_USER=$JIRA_USER" \
    -e "JIRA_PASS=$JIRA_PASS" \
    -e "SLACK_BOT_TOKEN=$SLACK_BOT_TOKEN" \
    cyb/slackbot