FROM cptactionhank/atlassian-confluence:latest

LABEL maintainer="Thor Høgås <thor at roht dot no>"
LABEL version="0.3"

USER root

COPY container/crowd.properties /opt/atlassian/confluence/confluence/WEB-INF/classes/crowd.properties

# set autowatch to false
#   see https://jira.atlassian.com/browse/CONF-22070
# also set server settings to match our use
RUN set -x && \
    mkdir /tmp/conf && \
    cp /opt/atlassian/confluence/confluence/WEB-INF/lib/confluence-[56]*.jar /tmp/conf/confluence.jar && \
    cd /tmp/conf && \
    jar xf confluence.jar && \
    sed -i '/confluence.prefs.watch.my.own.content/{N;s/\(.*\n.*\)true/\1false/}' preferences-default.xml && \
    xmlstarlet ed --inplace \
      --subnode /preferences -t elem -n preferenceTMP \
      --insert //preferenceTMP -t attr -n type -v "String" \
      --subnode //preferenceTMP -t elem -n name -v "confluence.user.time.zone" \
      --subnode //preferenceTMP -t elem -n value -v "Europe/Oslo" \
      --rename //preferenceTMP -v "preference" \
      preferences-default.xml && \
    cp -p preferences-default.xml /opt/atlassian/confluence/confluence/WEB-INF/classes/ && \
    rm -rf /tmp/conf && \
    chown daemon:daemon /opt/atlassian/confluence/confluence/WEB-INF/classes/crowd.properties && \
    chown daemon:daemon /opt/atlassian/confluence/confluence/WEB-INF/classes/seraph-config.xml && \
    echo 'Europe/Oslo' >/etc/timezone && \
    apk update && \
    apk add libc6-compat && \
	sed -ri 's/^(securerandom\.source\=file:).*/\1\/dev\/urandom/' \
        $JAVA_HOME/jre/lib/security/java.security

# TODO: Verify that the lack of dpkg-reconfigure isn't actually a problem 

COPY container/docker-entrypoint-cyb.sh /docker-entrypoint-cyb.sh

USER daemon

ENTRYPOINT ["/docker-entrypoint-cyb.sh"]
CMD ["/opt/atlassian/confluence/bin/start-confluence.sh", "-fg"]
