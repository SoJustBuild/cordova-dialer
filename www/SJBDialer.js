/*
 * Original from https://github.com/gaetansenn/PhoneGap-ios-PhoneDialer/blob/master/www/dialer.js
 * MIT Licensed
 * 
 * Modified and imported by Ozgur Susoy (Social Justice Builders I.T. Services) 2014
 */

var exec = require('cordova/exec');

module.exports = {

    /**
     * Call the native dialer
     **/
    dial: function(phnum, success, error) {
        if (phnum == null)
            error("empty");

		exec(
			function() {
				//if (typeof success === 'function') {
					success();
				//}
			},
			function(err) {
				//if (typeof err === 'function') {
					error(err);
				//}
			},
			"SJBDialer", "dial", [phnum]
		);
    },
};
