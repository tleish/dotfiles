#!/usr/bin/env bash

# get rvm & ruby
curl -L https://get.rvm.io | bash -s stable --ruby
rvm install 2.2.4 --disable-binary
rvm use 2.2.4 --default

# install gems
gem install bundler

# 
gem install robocop
gem install reek
gem install
