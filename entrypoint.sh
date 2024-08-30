#!/bin/bash

set -x
cd /blog
echo "Preparando la base de datos"
bundle exec rake db:prepare

exec "$@"
