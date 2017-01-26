#!/bin/sh

set -e

#adduser -D -u $USER_ID -g 1000 $USER_NAME #does not work? uid is use?!?
echo "$USER_NAME:x:$USER_ID:1000:nobody:/:/bin/sh" > /etc/passwd

CHOWN=$(/usr/bin/which chown)
CHMOD=$(/usr/bin/which chmod)
SQUID=$(/usr/bin/which squid)

# Ensure permissions are set correctly on the Squid cache + log dir.
"$CHOWN" -R $USER_NAME:$USERNAME /var/cache/squid
"$CHOWN" -R $USER_NAME:$USERNAME /var/log/squid
"$CHMOD" 777 /var/run/

# Prepare the cache using Squid.
echo "Initializing cache..."
/bin/su -c "$SQUID -z" $USER_NAME

# Give the Squid cache some time to rebuild.
sleep 5

# Launch squid
echo "Starting Squid..."
/bin/su -c "$SQUID -NYCd 1" $USER_NAME
#/bin/sh
