# docker-rails-demo

This project is a demo of my development environment setup for docker and rails.
This is a product of this blog post (NEED URL HERE).

## Prerequisites

- (docker)[https://docs.docker.com/engine/installation/]
- (docker-compose)[https://docs.docker.com/compose/install/]

## Installation

This project is designed to be run without having to install postgres or rails
dependencies on the host. Therefore, to run:

``` shell
git clone https://github.com/svametcalf/docker-rails-demo.git
cd docker-rails-demo/
docker-compose build      # build the docker images locally
docker-compose run rails test     # run tests
docker-compose up        # create containers and run them
```
