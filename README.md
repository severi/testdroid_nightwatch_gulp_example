# Nightwatch Testdroid Example

## Setup
0) Install Gulp
    ```
    $ npm install -g gulp
    ```

1) Install NPM Dependencies
    ```
    $ npm install
    ```
    
2) Add your apiKey to ./.credentials.json

   Create a file called ".credentials.json" and add your testdroid apiKey to it as described below:

    {
        "apiKey": "YOUR_TESTDROID_CLOUD_APIKEY"
    }


3) Modify the nightwatch.json-file according to your project

### Run the test 

A) To run the test on iOS
```
$ gulp ios
```

B) To run the test on Android
```
$ gulp android
```


