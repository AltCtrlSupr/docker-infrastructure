FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y postfix postfix-mysql syslog-ng syslog-ng-core && \
    sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf && \
    sed -i 's/^#\(SYSLOGNG_OPTS="--no-caps"\)/\1/g' /etc/default/syslog-ng
ADD postfix /etc/postfix

EXPOSE 25 465 587

CMD ["/bin/sh", "-c", "service syslog-ng start; service postfix start; umask 0 && truncate -s0 /var/log/mail.log; tail -n0 -F /var/log/mail.log"]
