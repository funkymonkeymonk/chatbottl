FROM ruby:2.3
MAINTAINER Will Weaver <monkey@buildingbananas.com>

ADD Gemfile /usr/src/app/
WORKDIR /usr/src/app
RUN bundle
ENTRYPOINT lita
