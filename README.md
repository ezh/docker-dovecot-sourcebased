docker-dovecot-sourcebased
==========================
[![Build Status](https://travis-ci.org/ezh/docker-dovecot-sourcebased.png?branch=master)](https://travis-ci.org/ezh/docker-dovecot-sourcebased) [![Pulls](https://img.shields.io/docker/pulls/ezh1k/dovecot.svg)](https://hub.docker.com/r/ezh1k/dovecot/) [![Releases](https://img.shields.io/github/release/ezh/docker-dovecot-sourcebased.svg)](https://github.com/ezh/docker-dovecot-sourcebased/releases) [![License](https://img.shields.io/github/license/ezh/docker-dovecot-sourcebased.svg)](https://github.com/ezh/docker-dovecot-sourcebased/blob/master/LICENSE) 

Docker compose source based dovecot with pigeonhole SOHO configuration

Dovecot source provided by https://github.com/dovecot/core

Pigeonhole source provided by https://github.com/dovecot/pigeonhole

By default it builds the stable *dovecot-2.2.28* and stable *pigeonhole-0.4.17* if you use docker compose.
It builds the latest unstable *master* if you build directly from Dockerfile.

[Hint #1](https://github.com/ezh/docker-dovecot-sourcebased/blob/master/docker/Dockerfile#L44),
[Hint #2](https://github.com/ezh/docker-dovecot-sourcebased/blob/master/docker-compose.yml#L7)

Image is based on `debian/jessie`, the same as an official Jenkis docker container.

Execution
---------

Dovecot executed directly as PID 1 process with logging to `STDOUT`.

Arguments
---------

You may set Dovecot version via `dovecot_branch` argument

You may set Pigeonhole version via `pigeonhole_branch` argument

You may set UID for `dovecot` user via `dovecot_user_id` argument

You may set UID for `dovenull` user via `dovenull_user_id` argument

Build parameters
----------------

You may alter build parameters of `Dovecot` with `dovecot_config` argument.

You may alter build parameters of `Pigeonhole` with `pigeonhole_config` argument.

Please look at Dockerfile for example.


Current Dovecot configuration:

```
Install prefix . : /usr
File offsets ... : 64bit
I/O polling .... : epoll
I/O notifys .... : inotify
SSL ............ : yes (OpenSSL)
GSSAPI ......... : no
passdbs ........ : static passwd passwd-file shadow pam checkpassword ldap sql
dcrypt ..........: yes
                 : -bsdauth -sia -vpopmail
userdbs ........ : static prefetch passwd passwd-file checkpassword ldap sql nss
                 : -vpopmail
SQL drivers .... : pgsql mysql sqlite
                 : -cassandra
Full text search : squat solr
                 : -lucene
```

Copyright
---------

Copyright © 2017 Alexey B. Aksenov/Ezh. All rights reserved.
