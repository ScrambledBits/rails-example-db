#!/bin/bash

set -x
cd /app
bundle exec rake db:prepare

exec "$@"
