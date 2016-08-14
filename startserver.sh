#!/bin/bash

set -e

bin/rails db:create &&
     bin/rails db:migrate &&
     bin/rails db:seed &&
     rails server -b 0.0.0.0
