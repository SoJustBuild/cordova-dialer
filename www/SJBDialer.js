var SJBDialer = function() {}

SJBDialer.prototype.dial = function(phnum) {
	alert("dial "+phnum);
	try{
    cordova.exec("SJBDialer.dialPhone", {"number" : phnum });
	}catch(e){alert("dial failed"+e);}
};

if(!window.plugins) {
    window.plugins = {};
}
if(!window.plugins.phoneDialer) {
    window.plugins.phoneDialer = new PhoneDialer();
}
