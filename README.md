# Nightwatch Testdroid Example

## Setup
* Install Gulp

	```
	$ npm install -g gulp
	```

* Install NPM Dependencies

	```
	$ npm install
	```
    
* Add your apiKey to ./.credentials.json

   Create a file called ".credentials.json" in the project's root and add your testdroid apiKey to it as described below:
	
	    {
	        "apiKey": "YOUR_TESTDROID_CLOUD_APIKEY"
	    }


* Modify the nightwatch.json-file according to your project

## Run the test 

* To run the test on iOS

	```
	$ gulp ios
	```

* To run the test on Android
	
	```
	$ gulp android
	```


