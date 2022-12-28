#!/bin/bash
set -e

bin/rails db:migrate
bin/rails webpacker:compile
# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
