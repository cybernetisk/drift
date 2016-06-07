FROM cptactionhank/atlassian-jira-software:latest

MAINTAINER Henrik Steen <henrist@henrist.net>

USER root

COPY container/crowd.properties /opt/atlassian/jira/atlassian-jira/WEB-INF/classes/crowd.properties

# ensure server uses correct timezone
# and do some other stuff
RUN set -x && \
    chown daemon:daemon /opt/atlassian/jira/atlassian-jira/WEB-INF/classes/crowd.properties && \
    chown daemon:daemon /opt/atlassian/jira/atlassian-jira/WEB-INF/classes/seraph-config.xml && \
    echo 'Europe/Oslo' >/etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

COPY container/docker-entrypoint-cyb.sh /docker-entrypoint-cyb.sh

USER daemon

ENTRYPOINT ["/docker-entrypoint-cyb.sh"]
CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]
