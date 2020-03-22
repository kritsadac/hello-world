#!/bin/bash

version=$(cat /app_version)
echo "hola $version" > /var/www/html/index.html
nginx -g "daemon off;"

