FROM ruby:3.0

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBCONF_NOWARNINGS=yes
ENV TZ Asia/Tokyo

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    # credentials.yml.enc編集用にvimを追加
    # && apt-get install -y vim \
    # cronをインストール
    && apt-get install -y cron \
    && apt-get install -y nodejs yarn postgresql-client

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY web/Gemfile /app/Gemfile
COPY web/Gemfile.lock /app/Gemfile.lock
RUN bundle install

# 本番用
COPY web/yarn.lock /app/yarn.lock
COPY web/package.json /app/package.json

COPY ./web /app
RUN SECRET_KEY_BASE="$(bundle exec rake secret)" bin/rails assets:precompile assets:clean \
&& yarn install --production --frozen-lockfile \
&& yarn cache clean \
&& rm -rf /app/node_modules /app/tmp/cache
# ---
# wheneverでcrontab書き込み
RUN bundle exec whenever --update-crontab
RUN service cron start

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
