FROM ruby:2.3
MAINTAINER Schuyler Metcalf <svametcalf@gmail.com>
ARG app_user

#install database dependencies
RUN apt-get install -y libpq-dev

# create an app user, using the build argument
RUN useradd $app_user

# Make app dir and copy files
RUN mkdir -p /usr/src/app
RUN chown $app_user /usr/src/app

# install a handy script for waiting for a host to respond
RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /usr/local/bin/wait-for-it.sh
RUN chmod a+x /usr/local/bin/wait-for-it.sh

# set our working directory
USER $app_user
WORKDIR /usr/src/app

# install gem dependencies
COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app
RUN bundle install

# add the app code to our container
COPY . /usr/src/app

EXPOSE "3000"

# set the base of all commands in this server
ENTRYPOINT ["bin/rails"]
