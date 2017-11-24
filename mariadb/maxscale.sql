CREATE USER 'maxscale'@'%' IDENTIFIED BY 'maxscalepass';
GRANT SELECT on mysql.user TO 'maxscale'@'%';
GRANT SELECT ON mysql.db TO 'maxscale'@'%';
GRANT SELECT ON mysql.tables_priv TO 'maxscale'@'%';
GRANT SHOW DATABASES ON *.* TO 'maxscale'@'%';

CREATE USER 'monitor'@'%' IDENTIFIED BY 'monitorpass';
GRANT REPLICATION CLIENT ON *.* TO 'monitor'@'%';
