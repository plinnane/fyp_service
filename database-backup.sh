#!/bin/sh
# backup
#test git
/usr/bin/java -cp /opt/wildfly-10.1.0.Final/modules/system/layers/base/com/h2database/h2/main/h2-1.3.173.jar org.h2.tools.Script -url "jdbc:h2:/opt/wildfly-10.1.0.Final/standalone/data/dywa;AUTO_SERVER=TRUE;MVCC=TRUE" -user sa -password sa -script /root/backup/fyp/fyp-db_$(date +"%Y-%m-%d_%H").sql
# compress backup
bzip2 /root/backup/fyp/fyp-db_$(date +"%Y-%m-%d_%H").sql
# delete old backups
find /root/backup/fyp -name "*.sql.bz2" -mtime +7 -exec rm {} \;
#find ${BACKUP_HOME -name „*.sql.bz2" -mtime +7 -exec rm {} \;
