FROM ruby:latest
WORKDIR /usr/app/src
COPY . .
RUN gem install test-unit
CMD [ "ruby", "./unitTestExp4.rb"]