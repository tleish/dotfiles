#!/usr/bin/env bash

# libs
brew install freetds

# install redis
brew tap gapple/services
brew install redis
brew services start redis

# princexml
brew tap caius/prince
brew install prince

# Install MySQL
brew install homebrew/versions/percona-server56
brew services start percona-server56
