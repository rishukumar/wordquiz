//
//  wordQuizTabTests.m
//  wordquiz
//
//  Created by Saran on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "wordQuizTabTests.h"

#import <UIKit/UIKit.h>
//#import "application_headers" as required

@implementation wordQuizTabTests

// All code under test is in the iOS Application
- (void)testAppDelegate
{
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
}

@end
