#!/bin/bash
set -eo pipefail

if [ ! -z "$MYSQL_CREATE_DATADIR" ]; then
  echo "Creating Mysql data dir.."
  mkdir -p /var/lib/mysql/mysql
fi

if [ ! -f ".pass_initialize" ]; then
  maxscalepass=$(maxpasswd maxscalepass)
  monitorpass=$(maxpasswd monitorpass)

  sed -i "s/passwd=maxscalepass/passwd=$maxscalepass/g" /home/maxscale.cnf
  sed -i "s/passwd=monitorpass/passwd=$monitorpass/g" /home/maxscale.cnf
  mv -f /home/maxscale.cnf /etc/maxscale.cnf
  touch .pass_initialize
fi
maxscale &
docker-entrypoint.sh "$@"
