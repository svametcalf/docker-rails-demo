FROM ruby:2.3
MAINTAINER Schuyler Metcalf <svametcalf@gmail.com>

#install database dependencies
RUN apt-get install -y libpq-dev

RUN useradd schuyler


# Make app dir and copy files
RUN mkdir -p /usr/src/app
RUN chown schuyler /usr/src/app


RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /usr/local/bin/wait-for-it.sh

RUN chmod a+x /usr/local/bin/wait-for-it.sh

USER schuyler
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app
RUN bundle install


COPY . /usr/src/app

EXPOSE "3000"
ENTRYPOINT ["bin/rails"]
