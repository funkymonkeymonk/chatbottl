#!/bin/bash -ex

curl $GEMFILE > Gemfile
cat Gemfile

curl $LITA_CONFIG > lita_config.rb
cat lita_config.rb

bundle
lita $*
