
module.exports = {
    'Basic Test Example' : function (browser) {
        browser
            .url('http://testdroid.com/')
            .waitForElementVisible('body', 1000)
            .assert.title('Testdroid - Mobile App Testing on Android and iOS Devices')
            .end();
    }
};