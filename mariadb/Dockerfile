FROM mariadb:10.1.23

MAINTAINER Taeil Seok "syuo7@naver.com"

EXPOSE 3306 4444 4567 4567/udp 4568 5405/udp
RUN sh -c "echo 'deb http://ftp.uk.debian.org/debian/ jessie-backports main contrib non-free' >> /etc/apt/sources.list" && \
apt-get update && \
apt-get install -y curl && \
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash && \
apt-get -y install maxscale && \
apt-get -y install -t jessie-backports pacemaker corosync crmsh && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /etc/apt/sources.list.d/*

RUN maxkeys && chown maxscale /var/lib/maxscale/.secrets
RUN rm -f /etc/maxscale.cnf
RUN rm -f /etc/corosync/corosync.conf
#RUN crm configure property 'stonith-enabled'='false'
#RUN crm configure property 'no-quorum-policy'='ignore'

ADD maxscale.cnf /home/maxscale.cnf
ADD cluster.cnf /etc/mysql/conf.d/cluster.cnf
ADD mariadb-entrypoint.sh /home/mariadb-entrypoint.sh
WORKDIR /home
RUN chmod +x /home/mariadb-entrypoint.sh

ENTRYPOINT ["/home/mariadb-entrypoint.sh"]
CMD ["mysqld"]
