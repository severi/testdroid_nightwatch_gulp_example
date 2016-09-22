
module.exports = {
    'Basic Test Example' : function (browser) {
        browser
            .url('http://testdroid.com/')
            .waitForElementVisible('body', 4000)
            .pause(5000)
            .assert.title('Mobile App Testing on Thousands of Devices | Bitbar Testing')
            .end();
    }
};