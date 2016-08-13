FROM ruby:2.3
MAINTAINER Schuyler Metcalf <svametcalf@gmail.com>

#install database dependencies
RUN apt-get install -y libpq-dev


# Make app dir and copy files
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app
RUN bundle install

COPY . /usr/src/app
EXPOSE "3000"
ENTRYPOINT ["bin/rails"]
