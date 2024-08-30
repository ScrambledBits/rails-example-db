#!/bin/bash

set -x
cd /app
echo "Preparando la base de datos"
bundle exec rake db:prepare

exec "$@"
