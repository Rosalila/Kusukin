FROM ruby:2.2
RUN apt-get update -qq && apt-get install -y libcurl3 libcurl3-gnutls libcurl4-openssl-dev curl build-essential libpq-dev libxml2 zlib1g-dev libncurses5-dev libncurses5 libxslt-dev libxml2-dev libssl-dev libyaml-dev libffi-dev make autoconf libmagickcore-dev libmagickwand-dev imagemagick

ENV APP_HOME /web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler

RUN bundle install

ADD . $APP_HOME
ADD config/database.yml.docker config/database.yml

EXPOSE 8080
CMD rake db:create && rake db:migrate && rake rails:update:bin && rails s -p 8080 -b '0.0.0.0'
