# ローカル----------
# set -e

# rm -f /app/tmp/pids/server.pid

# exec "$@"


# デプロイ------------
#!/bin/sh
set -e

bin/rails db:migrate
bin/rails db:seed

rm -f /app/tmp/pids/server.pid && bin/rails s