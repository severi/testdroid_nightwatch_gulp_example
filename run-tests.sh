#!/bin/bash

## Cloud setup
echo "Starting Appium ..."

/opt/appium/appium/bin/appium.js --log-no-colors --log-timestamp --command-timeout 120 >appium.log 2>&1 &

# Wait for appium to fully launch
sleep 10

ps -ef|grep appium

mkdir .npm_cache
npm config set cache ~/.npm_cache

echo "Extracting tests.zip..."
unzip tests.zip

echo "Installing Project Dependencies..."
npm install

rm -f tests/reports/*

echo "Running Tests..."
node_modules/gulp/bin/gulp.js android

cp tests/reports/*.xml TEST-all.xml

echo "Finished Running Tests!"
