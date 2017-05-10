#!/bin/bash

# Configurations
DB_NAME=("DB1" "DB2")
DB_HOST="localhost"
DB_USER="root"
DB_PASSWORD="root"

BACKUP_DIR="/home/dbs"

echo "Dumping database..."
cd $BACKUP_DIR

for i in "${DB_NAME[@]}"
do
  echo "Start dumping $i .."
  mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $i > $i.sql
  echo "Dumping $i has been finished .."

  # I prefer to archive the folder instead of archiving each one separately.
  #echo "Adding $i database dump to files archive..."
  #tar rf "$i.tar" $i.sql
  #rm -f $i.sql
done

