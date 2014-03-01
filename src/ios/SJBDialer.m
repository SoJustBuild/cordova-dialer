//
// PhoneDialer.m
// MIT Licensed
//
// Created by Justin McNally on 11/17/11.
// Copyright (c) 2011 Kohactive. All rights reserved.
//

#import "SJBDialer.h"
#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>

@implementation SJBDialer

- (void)dial:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        NSString* url;
        NSString* number = [command.arguments objectAtIndex:0];

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
                                        message:@"Test native laert for debugging" 
                                        delegate:self 
                                        cancelButtonTitle:@"Ok"
                                        otherButtonTitles: nil];
	[alert show];
    	//[alert release];

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

        // return result
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

@end

