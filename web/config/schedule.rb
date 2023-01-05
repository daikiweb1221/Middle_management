# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :production
# 開発環境↓
#:development

# cronを実行する環境変数をセット
set :environment, rails_env
# Docker用環境変数
ENV.each { |k, v| env(k, v) }

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

#毎日0時ごとに（:hour）実行する先程設定したrakeタスクを記入
# every 1.days, at: '0:00 am' do
#   rake 'reset_communications:reset_communications'
# end

# 1分毎に回すテスト
every 1.minute do
  rake 'reset_communications:reset_communications'
end

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
