FROM ruby:2.3
MAINTAINER Will Weaver <monkey@buildingbananas.com>

ADD start-lita.sh /usr/src/app/start-lita
RUN chmod +x /usr/src/app/start-lita
WORKDIR /usr/src/app
CMD /usr/src/app/start-lita
