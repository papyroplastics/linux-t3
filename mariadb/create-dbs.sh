#!/usr/bin/env bash

echo "Creating custom databases"

if [[ -z "$WORDPRESS_DATABASE" ]]; then
    echo "WORDPRESS_DATABASE environment variable not set."
    exit 1
elif [[ -z "$MOODLE_DATABASE" ]]; then
    echo "MOODLE_DATABASE environment variable not set."
    exit 1
fi

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS \`$WORDPRESS_DATABASE\`;
CREATE DATABASE IF NOT EXISTS \`$MOODLE_DATABASE\`;
EOSQL

if [[ $? != 0 ]]; then
    echo "Error creating wordpress database"
    exit 1
fi

