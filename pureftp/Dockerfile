FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://http.debian.net/debian wheezy main contrib non-free\n\
deb-src http://http.debian.net/debian wheezy main contrib non-free\n\
deb http://http.debian.net/debian wheezy-updates main contrib non-free\n\
deb-src http://http.debian.net/debian wheezy-updates main contrib non-free\n\
deb http://security.debian.org wheezy/updates main contrib non-free\n\
deb-src http://security.debian.org wheezy/updates main contrib non-free\n\
" > /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y --force-yes install dpkg-dev debhelper && \
    apt-get -y build-dep pure-ftpd-mysql && \
    mkdir /tmp/pure-ftpd-mysql && \
    cd /tmp/pure-ftpd-mysql && \
    apt-get source pure-ftpd-mysql && \
    cd pure-ftpd-* && \
    sed -i '/^optflags=/ s/$/ --without-capabilities/g' ./debian/rules && \
    dpkg-buildpackage -b -uc && \
    dpkg -i /tmp/pure-ftpd-mysql/pure-ftpd-common*.deb && \
    apt-get -y install openbsd-inetd && \
    dpkg -i /tmp/pure-ftpd-mysql/pure-ftpd-mysql*.deb && \
    apt-mark hold pure-ftpd pure-ftpd-mysql pure-ftpd-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

EXPOSE 21/tcp

CMD /usr/sbin/pure-ftpd-wrapper
