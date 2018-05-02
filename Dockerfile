FROM ruby:2.4

RUN apt-get update && apt-get install -y \
      nodejs \
      postgresql-client \
      sqlite3 \
      --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp
ENV APP_ROOT /myapp

WORKDIR $APP_ROOT

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
