/* Original from https://github.com/gaetansenn/PhoneGap-ios-PhoneDialer/blob/master/www/dialer.js */

var exec = require('cordova/exec');

module.exports = {

    /**
     * Call the native dialer
     *
     * @param {String, Function} The phone number to call, The callback error function
     */
    dial: function(phnum, success, error) {
	//alert('dial called');
        if (phnum == null)
            error("empty");
try{
//alert("start exec");
        exec(function() {
		//alert('dial success');
		if (typeof success === 'function') {
			success();
		}
	     }, function(err) {
		//alert('dial fail');
		if (typeof err === 'function') {
			error(err);
		}
        }, "SJBDialer", "dial", [phnum]);
}catch(e){alert('err in dial: '+e);}
	alert('exec complete');
    },
};

