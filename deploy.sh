#!/bin/bash
set -e

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "me@thebitlink.com"

# Create a copy of the default variant on the root directory.
cp variants/discord-adapta@default.css discord-adapta.css

# Commit build
git checkout master
git add variants/*
git add discord-adapta.css
git commit -m "Auto Build"

git push "https://${GITHUB_SECRET_TOKEN}@${GH_REF}" master > /dev/null 2>&1
