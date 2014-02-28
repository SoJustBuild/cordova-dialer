/* Original from https://github.com/gaetansenn/PhoneGap-ios-PhoneDialer/blob/master/www/dialer.js */

var exec = require('cordova/exec');

module.exports = {

    /**
     * Call the native dialer
     *
     * @param {String, Function} The phone number to call, The callback error function
     */
    dial: function(phnum, success, error) {
        if (phnum == null)
            error("empty");
        exec(function() {
			if (typeof success === 'function') {
				success();
			}
		}, function(err) {
			if (typeof err === 'function') {
				error(err);
			}
        }, "SJBDialer", "dial", [phnum]);
    },
};

