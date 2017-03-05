#!/bin/bash
#

chmod a+r /dev/fd/0
chmod a+w /dev/fd/1
chmod a+w /dev/fd/2

# Environment variables are set before first run
# Set initial UID:GID

CURRENT_DOVECOT_USER_ID=$(id -u dovecot)
CURRENT_DOVECOT_GROUP_ID=$(id -g dovecot)

if [ -n "$DOVECOT_USER_ID" -a "$DOVECOT_USER_ID" != "$CURRENT_DOVECOT_USER_ID" ]
then
    echo Change DOVECOT user id from $CURRENT_DOVECOT_USER_ID to $DOVECOT_USER_ID
    usermod -u $DOVECOT_USER_ID dovecot
fi
if [ -n "$DOVECOT_GROUP_ID" -a "$DOVECOT_GROUP_ID" != "$CURRENT_DOVECOT_GROUP_ID" ]
then
    echo Change DOVECOT group id from $CURRENT_DOVECOT_GROUP_ID to $DOVECOT_GROUP_ID
    groupmod -g $DOVECOT_GROUP_ID dovecot
fi
echo Dovecot user defined as `id dovecot`

CURRENT_DOVENULL_USER_ID=$(id -u dovenull)
CURRENT_DOVENULL_GROUP_ID=$(id -g dovenull)

if [ -n "$DOVENULL_USER_ID" -a "$DOVENULL_USER_ID" != "$CURRENT_DOVENULL_USER_ID" ]
then
    echo Change DOVENULL user id from $CURRENT_DOVENULL_USER_ID to $DOVENULL_USER_ID
    usermod -u $DOVENULL_USER_ID dovenull
fi
if [ -n "$DOVENULL_GROUP_ID" -a "$DOVENULL_GROUP_ID" != "$CURRENT_DOVENULL_GROUP_ID" ]
then
    echo Change DOVENULL group id from $CURRENT_DOVENULL_GROUP_ID to $DOVENULL_GROUP_ID
    groupmod -g $DOVENULL_GROUP_ID dovenull
fi
echo Dovenull user defined as `id dovenull`

exec $@
