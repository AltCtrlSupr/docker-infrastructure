FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y libsasl2-modules-sql sasl2-bin postfix postfix-mysql syslog-ng syslog-ng-core && \
    sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf && \
    sed -i 's/^#\(SYSLOGNG_OPTS="--no-caps"\)/\1/g' /etc/default/syslog-ng && \
    adduser postfix sasl
ADD postfix /etc/postfix
ADD sasl/saslauthd /etc/default/saslauthd

EXPOSE 25 465 587

ENV POSTFIX_USER postfix_user
ENV POSTFIX_PASSWORD postfix_password
ENV POSTFIX_DB_HOST postfix_db_host
ENV POSTFIX_DB_NAME postfix_db_name

ADD start.sh /root/start.sh
CMD /root/start.sh
