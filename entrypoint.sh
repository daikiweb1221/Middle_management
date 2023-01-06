#!/bin/bash
set -e

# 本番有効
bin/rails db:migrate

# wheneverでcrontab書き込み
bundle exec whenever --update-crontab
service cron start
service cron status

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
