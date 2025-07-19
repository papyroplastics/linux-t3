#!/usr/bin/env bash

echo "Creating custom databases"

if [[ -z "$DATABASES" ]]; then
    echo "DATABASES environment variable not set."
    exit 1
elif [[ -z "$MYSQL_ROOT_PASSWORD" ]]; then
    echo "MYSQL_ROOT_PASSWORD environment variable not set."
    exit 1
fi

for dbname in $DATABASES; do
    mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS \`$dbname\`;
EOSQL

    if [[ $? != 0 ]]; then
        echo "Error creating database \"$dbname\""
    else
        echo "Created database \"$dbname\""
    fi
done

