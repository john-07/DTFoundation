//
//  ViewController.m
//  DTReachability Demo
//
//  Created by Oliver Drobnik on 5/31/13.
//  Copyright (c) 2013 Cocoanetics. All rights reserved.
//

#import "ViewController.h"
#import "DTReachability.h"

@interface ViewController ()

@end

@implementation ViewController
{
	id _observer; // reference for reachability observer
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// register a reachability observer
	
	__weak ViewController *weakself = self;
	_observer = [DTReachability addReachabilityObserverWithBlock:^(SCNetworkConnectionFlags connectionFlags) {
		
		// update label based on connection flags
		
		if (DTReachabilityIsReachableFromFlags(connectionFlags))
		{
			weakself.label.text = @"Reachable";
			weakself.label.textColor = [UIColor greenColor];
		}
		else
		{
			weakself.label.text = @"Not Reachable";
			weakself.label.textColor = [UIColor redColor];
		}
	}];
}

- (void)dealloc
{
	[DTReachability removeReachabilityObserver:_observer];
	_observer = nil;
}

@end
