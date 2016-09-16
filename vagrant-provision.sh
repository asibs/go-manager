#!/bin/bash

# Following guide to install rails on Ubuntu 14.04 as per https://gorails.com/setup/ubuntu/14.04

# 1 - Install ruby dependencies
echo "*** Start Step 1 ***"
sudo apt-get update
sudo apt-get --assume-yes install git git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
echo "*** Finished Step 1 ***"

# 2 - Install Ruby with rbenv (use ruby 2.1.5 as per AWS)
# Note, as we're scripting, can't use exec $SHELL (causes shell to replace itself)
# Instead set path for this session and also update .bashrc for future logins
echo "*** Start Step 2 ***"
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

rbenv install 2.3.1
rbenv global 2.3.1
echo "*** Finished Step 2 ***"

# 3 - Install bundler
echo "*** Start Step 3 ***"
gem install bundler
echo "*** Finish Step 3 ***"

# (skip git config, varies per user, and assume editing and pushing to git will take place on users local machine anyway)

# 4 - Install rails dependencies (node.js)
echo "*** Start Step 4 ***"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get --assume-yes install nodejs
echo "*** Finish Step 4 ***"

# 5 - Install rails 5
echo "*** Start Step 5 ***"
gem install rails --version '>= 5'
echo "*** Finish Step 5 ***"

# 6 - Install MySql (use 5.6 which is supported by AWS - AWS supports 5.7 as well, but Ubuntu apt only has up to 5.6 atm)
echo "*** Start Step 6 ***"
# Provide password for MySql install prompt
sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password password changeMe'
sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password_again password changeMe'
sudo apt-get --assume-yes install mysql-server-5.6
sudo apt-get --assume-yes install mysql-client-5.6
sudo apt-get --assume-yes install libmysqlclient-dev
echo "*** Finish Step 6 ***"
