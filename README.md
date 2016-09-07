# Nightwatch Testdroid Example

## Setup
1) Install NPM Dependencies
    ```sh
    $ npm install
    ```
2) Add your apiKey to ./.credentials.json

    Create a file called ".credentials.json" and add your testdroid apiKey to it as described below:
    ```json
    {
        "apiKey": "YOUR_TESTDROID_CLOUD_APIKEY"
    }
    ```

3) Modify the nightwatch.json-file according to your project

### Run the test 

A) To run the test on iOS
```sh
$ gulp ios
```

B) To run the test on Android
```sh
$ gulp android
```


