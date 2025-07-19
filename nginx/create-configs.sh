#!/bin/sh

rm -f /etc/nginx/conf.d/default.conf

for pair in $HOSTS; do
    host=`echo "$pair" | cut -d: -f1`
    port=`echo "$pair" | cut -d: -f2`
    cat /etc/nginx/template.conf | sed "s/TEMPLATE_HOST/$host/g" \
        | sed "s/TEMPLATE_PORT/$port/g" > /etc/nginx/conf.d/$host.conf

    if [[ $? != 0 ]]; then
        echo "Error creating config for \"$pair\""
    else
        echo "Created config for \"$pair\""
    fi
done

