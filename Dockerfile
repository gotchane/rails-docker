FROM ruby:2.4

ENV APP_ROOT /opt

WORKDIR $APP_ROOT

RUN apt-get update && apt-get install -y \
      nodejs \
      postgresql-client \
      sqlite3 \
      --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN gem install rails \
    rails new sample_app

WORKDIR $APP_ROOT/sample_app

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3333"]

EXPOSE 3333
