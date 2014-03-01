//
// PhoneDialer.h
//
// Created by Justin McNally on 11/17/11.
// Copyright (c) 2011 Kohactive. All rights reserved.
//
// MIT License
//
#import <Cordova/CDVPlugin.h>

@interface SJBDialer : CDVPlugin

- (void)dial:(CDVInvokedUrlCommand*)command;

@end

