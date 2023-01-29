FROM ruby:latest
WORKDIR /usr/app/src
ARG val1 val2
ENV arg1=${val1} arg2=${val2}
RUN  echo ${val1}
COPY . .
CMD [ "ruby", "./rubyScript.rb"]