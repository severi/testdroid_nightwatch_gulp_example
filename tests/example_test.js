
module.exports = {
    'Basic Test Example' : function (browser) {
        browser
            .url('http://testdroid.com/')
            .waitForElementVisible('body', 1000)
            .assert.title('Mobile DevOps for App Testing and Monitoring | Bitbar')
            .end();
    }
};