#!/bin/bash



changeNpmCacheLocation(){
	echo "Change npm cache to .npm_cache folder..."
	mkdir .npm_cache
	npm config set cache ~/.npm_cache
}

startIOSWebkitProxy(){
	ls -la /Users/Shared/libimobiledevice-binaries-master
    echo "Starting ios_webkit_debug_proxy for UID ${UDID}" 
    # ios_webkit_debug_proxy -c ${UDID}:27753 -d &
    # export DYLD_FALLBACK_LIBRARY_PATH=/Users/Shared/libimobiledevice-binaries-master
    # export DYLD_FALLBACK_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/Users/Shared/libimobiledevice-binaries-master
    # printenv
    echo "brew install libimobiledevice"
	brew install libimobiledevice

    # /opt/appium/bin/ios-webkit-debug-proxy-launcher.js -c ${UDID}:27753 -d > ios-webkit-debug-proxy.log 2>&1 &
    # /opt/appium/bin/ios-webkit-debug-proxy-launcher.js -c ${UDID}:27753 -d &

    echo "Will start ios_webkit on port: 27753"
	node /opt/appium/bin/ios-webkit-debug-proxy-launcher.js -c ${UDID}:27753 -d > ios-webkit-debug-proxy.log 2>&1 &
}


startAppium(){
	if [ "$(uname)" == "Darwin" ]; then
		startIOSWebkitProxy
	    echo "Starting Appium on Mac..." 
		node /opt/appium/bin/appium.js -U ${UDID} --log-no-colors --log-timestamp --show-ios-log --screenshot-dir screenshots >appium.log 2>&1 &     
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	    echo "Starting Appium on Linux..."
		/opt/appium/appium/bin/appium.js --log-no-colors --log-timestamp >appium.log 2>&1 &
	else
		echo "Operating system not supported, exiting..."
		exit 1
	fi

	sleep 10
	ps -ef|grep appium
}

initializeTestRun(){
	echo "Extracting tests.zip..."
	unzip tests.zip
	echo "Installing Project Dependencies..."
	npm install
	rm -f tests/reports/*
}

executeTests(){
	if [ "$(uname)" == "Darwin" ]; then
	   	echo "Running iOs Tests..."
		node_modules/gulp/bin/gulp.js iosServerSide
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	    echo "Running Android Tests..."
		node_modules/gulp/bin/gulp.js androidServerSide
	fi
	echo "Finished Running Tests!"

	cp tests/reports/*.xml TEST-all.xml

	if [ ! -f "TEST-all.xml" ]; then 
		echo "Error occured during the test run"; 
		exit 1
	fi
}


changeNpmCacheLocation
startAppium
initializeTestRun
executeTests

