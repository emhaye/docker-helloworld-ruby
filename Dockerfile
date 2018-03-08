FROM alpine
MAINTAINER Mahyuddin "yudi.al@gmail.com"

RUN apk update && \
  apk upgrade && \
  apk add ruby ruby-json ruby-io-console ruby-bundler && \
  rm -rf /var/cache/apk/*

ENV APPS_PATH /apps/
RUN mkdir $APPS_PATH
WORKDIR $APPS_PATH

COPY . $APPS_PATH

RUN gem install sinatra --no-rdoc --no-ri
RUN bundle install --local

ENV PORT 4000
EXPOSE $PORT

CMD ["ruby", "/apps/server.rb"]
