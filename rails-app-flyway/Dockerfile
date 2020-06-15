FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /railsapp

WORKDIR /railsapp

ADD Gemfile /railsapp/Gemfile

ADD Gemfile.lock /railsapp/Gemfile.lock

RUN bundle install

ADD . /railsapp

CMD bundle exec rails s -p 3000 -b '0.0.0.0'

