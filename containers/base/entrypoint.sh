#!/bin/bash

set -eux
rm /dev/random
mknod /dev/random c 1 9
echo "loading config file: "${CONFIG_NAME}
exec /srv/bin/start -Djava.security.egd=file:/dev/./urandom -Dconfig.resource=${CONFIG_NAME}