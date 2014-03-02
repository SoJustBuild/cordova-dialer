//
// PhoneDialer.h
// Created by Justin McNally on 11/17/11.
// Copyright (c) 2011 Kohactive. All rights reserved.
// https://github.com/j-mcnally/PhoneGap-ios-PhoneDialer
//
// MIT Licensed
//
// Modified and imported by Ozgur Susoy (Social Justice Builders I.T. Services)
// 2014
//

#import <Cordova/CDVPlugin.h>

@interface SJBDialer : CDVPlugin

- (void)dial:(CDVInvokedUrlCommand*)command;

//- (void)hasPhone:(CDVInvokedUrlCommand*)command;

@end
