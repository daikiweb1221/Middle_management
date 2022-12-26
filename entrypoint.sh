#!/bin/bash
set -e

bin/rails db:migrate
bin/rails db:seed
# Remove a potentially pre-existing server.pid for Rails.
# rm -f /app/tmp/pids/server.pid
rm -f tmp/pids/server.pid && bin/rails s

# Then exec the container's main process (what's set as CMD in the Dockerfile).
# exec "$@"