/*
 * Original from https://github.com/gaetansenn/PhoneGap-ios-PhoneDialer/blob/master/www/dialer.js
 * MIT Licensed
 * 
 * Modified and imported by Ozgur Susoy (Social Justice Builders I.T. Services) 2014
 */

var exec = require('cordova/exec');

module.exports = {

    /**
     * Call the native dialer. Note that no checks are done on the callbacks
	 * for now so son't call it without proper callbacks!
     **/
    dial: function(phnum, success, error) {
        if (phnum == null)
            error("empty");

		exec(
			function() {
				success();
			},
			function(err) {
				error(err);
			},
			"SJBDialer", "dial", [phnum]
		);
    },

	hasPhone: function(successs, error) {
		exec(
			function() {
				success();
			},
			function(err) {
				error(err);
			},
			"SJBDialer", "hasPhone", []
		);
	},
};
