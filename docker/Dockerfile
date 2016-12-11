FROM buildpack-deps:jessie-curl

# http://wiki2.dovecot.org/CompilingSource
RUN set -x && \
    apt-get update -y && apt-get -y install apt-utils && \
    apt-get -y install git ca-certificates wget file automake autoconf pandoc libtool pkg-config gettext \
        libsqlite3-dev sqlite3 libpcre3-dev build-essential libdb-dev libmysqlclient-dev libsasl2-dev libexpat1-dev \
        libssl-dev libcdb-dev libbz2-dev liblzma-dev liblz4-dev libgc-dev libpq-dev libldap2-dev libgnutls28-dev libpam-dev && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* /download/directory

COPY entrypoint.sh /

ARG dovecot_branch=master
ARG dovecot_user_id=797
ARG dovenull_user_id=798
ARG dovecot_config="--enable-maintainer-mode \
        --enable-dependency-tracking \
        --with-shadow \
        --with-nss \
        --with-pam \
        --with-cdb \
        --with-zlib \
        --with-bzlib \
        --with-lzma \
        --with-lz4 \
        --with-gc \
        --with-storages=maildir \
        --with-ldap \
        --with-sqlite \
        --with-mysql \
        --with-pgsql \
        --with-solr \
        --with-ssl=openssl \
        --sysconfdir=/etc \
        --prefix=/usr \
        --localstatedir=/var"
ARG pigeonhole_branch=master
ARG pigeonhole_config="--with-dovecot=../dovecot --sysconfdir=/etc --prefix=/usr --localstatedir=/var"
RUN set -x && \
    useradd -r -s /bin/false -u ${dovecot_user_id} dovecot && \
    useradd -r -s /bin/false -u ${dovenull_user_id} dovenull && mkdir /opt/dovecot/ && \
    cd /opt/dovecot/ && git init . && git remote add -t ${dovecot_branch} origin https://github.com/dovecot/core && \
    git fetch --depth=1 && git checkout ${dovecot_branch} && ./autogen.sh && \
    ./configure ${dovecot_config} && \
    make && make install && cd .. && mkdir /opt/pigeonhole/ && \
    cd /opt/pigeonhole && git init . && git remote add -t ${pigeonhole_branch} origin https://github.com/dovecot/pigeonhole.git && \
    git fetch --depth=1 && git checkout ${pigeonhole_branch} && ./autogen.sh && \
    ./configure ${pigeonhole_config} && \
    make && make install && cd .. && \
    rm -rf /opt/dovecot && \
    rm -rf /opt/pigeonhole && \
    chmod a+x /entrypoint.sh

VOLUME ["/etc/dovecot", "/var/spool/dovecot"]

ENTRYPOINT ["/entrypoint.sh"]

COPY config/ /etc/dovecot/

CMD ["dovecot", "-F"]
