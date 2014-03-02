//
// PhoneDialer.m
// Created by Justin McNally on 11/17/11.
// Copyright (c) 2011 Kohactive. All rights reserved.
// https://github.com/j-mcnally/PhoneGap-ios-PhoneDialer
//
// MIT Licensed
//
// Modified and imported by Ozgur Susoy (Social Justice Builders I.T. Services)
// 2014
//

#import "SJBDialer.h"
#import <Cordova/CDV.h>

@implementation SJBDialer

- (void)dial:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
@try{
        CDVPluginResult* pluginResult = nil;
        NSString* url;
        NSString* number = [command.arguments objectAtIndex:0];

        if (number != nil && [number length] > 0) {
            if ([number hasPrefix:@"tel:"]) {
                url = number;
            } else {
                // escape characters such as spaces that may not be accepted by openURL
                url = [NSString stringWithFormat:@"tel:%@",
                [number stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            // openURL is expected to fail on devices that do not have the Phone app, such as simulators, iPad, iPod touch
            if(![[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]]) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feature"];
            }
        } else {
            // missing phone number
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"empty"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@catch (NSException *exception) {
	[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"exception"] callbackId:command.callbackId];
}
    }];
}

- (void)hasPhone:(CDVInvokedUrlCommand*)command
{
	[self.commandDelegate runInBackground:^{
@try{
		CDVPluginResult* pluginResult = nil;
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Debug" message:@"in hasPhone native" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
[alert show];
		if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]]) {
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Debug" message:@"canOpenURL" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
[alert show];
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		} else {
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Debug" message:@"canOpenURL fail" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
[alert show];
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"nophone"];
		}

		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@catch (NSException *exception) {
	[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"exception"] callbackId:command.callbackId];
}
	}];
}

@end
