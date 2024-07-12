#!/bin/bash

set -x
cd /app
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake assets:precompile

exec "$@"
