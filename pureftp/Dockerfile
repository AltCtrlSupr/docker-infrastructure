FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://http.debian.net/debian jessie main contrib non-free" > /etc/apt/sources.list && \ 
    echo "deb-src http://http.debian.net/debian jessie main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://http.debian.net/debian jessie-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://http.debian.net/debian jessie-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org jessie/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://security.debian.org jessie/updates main contrib non-free" >> /etc/apt/sources.list && \
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

ENV AllowDotFiles Yes
ENV ChrootEveryone Yes
ENV CreateHomeDir Yes
ENV MinUID 1000
ENV NoAnonymous Yes
ENV NoTruncate Yes
ENV PassivePortRange "19152 65534"

ENV PUREFTPD_USER pureftpd_user
ENV PUREFTPD_PASSWORD pureftpd_password
ENV PUREFTPD_DB_HOST pureftpd_db_host
ENV PUREFTPD_DB_NAME pureftpd_db_name
ENV PUREFTPD_ENC cleartext



ADD pure-ftpd /etc/pure-ftpd
ADD start.sh .
CMD start.sh
