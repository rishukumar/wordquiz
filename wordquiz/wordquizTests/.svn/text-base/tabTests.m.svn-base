//
//  tabTests.m
//  wordquiz
//
//  Created by Saran on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "tabTests.h"
#import "AppDelegate.h"
#import "CategoriesViewController.h"

#import <UIKit/UIKit.h>
//#import "application_headers" as required

@implementation tabTests

-(void)setUp{
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    tabBarController = (UITabBarController*)appDelegate.window.rootViewController;


}

// All code under test is in the iOS Application
- (void)testTabBar
{
    STAssertNotNil(appDelegate, @"UIApplication failed to find the AppDelegate");
    STAssertNotNil(tabBarController, @"Tab bar controller cannot be nil");
    
    NSUInteger tabCount = [tabBarController.tabBar.items count];
    STAssertTrue(tabCount == 4, @"Tab items are not equal to 4");
    
}

- (void)testCategoryTabSelection{
    [tabBarController setSelectedIndex:2];
    STAssertTrue((tabBarController.selectedIndex == 2), @"Selected index should be 2"); 
    
    UINavigationController *navController = (UINavigationController*)tabBarController.selectedViewController;
    STAssertNotNil(navController, @"Nav controller cannot be nil on category tab");
    
    BOOL hasCategoryViewController = [[navController.viewControllers objectAtIndex:0] isKindOfClass:CategoriesViewController.class];
    STAssertTrue(hasCategoryViewController, @"Category tab does not contains category view controller");
    
}



@end
