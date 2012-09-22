//
//  AdwhirlViewController.m
//  wordquiz
//
//  Created by John wesley moses on 16/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AdwhirlViewController.h"
#import "AppDelegate.h"
#import "HomeViewController.h"

#define kSampleAppkey = @"2e2ab4db4452454ba676478bdfgffgedbe36"
@implementation AdwhirlViewController
@synthesize adView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    adView=[AdWhirlView requestAdWhirlViewWithDelegate:self];
   // AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   // NSArray *vcs = appDelegate.window.rootViewController.childViewControllers;   
    
      //  UIViewController *test=[vcs objectAtIndex:0];
  // if(self.view.tag==0)
 //  {
        [self.view addSubview:adView];
  // }
  
}
- (NSString *)adWhirlApplicationKey {
	// return your SDK key  
	return kSampleAppKey;
	
}
- (UIViewController *)viewControllerForPresentingModalView {
	
	//return UIWindow.viewController;
   // UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard"
     //                                                        bundle: nil];
    
  //  AppDelegate *controller = (AppDelegate*)[mainStoryboard 
          //                                             instantiateViewControllerWithIdentifier: @"<Controller ID>"];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSArray *vcs = appDelegate.window.rootViewController.childViewControllers;   

	return [vcs objectAtIndex:0];
	
}

- (void)adWhirlDidReceiveAd:(AdWhirlView *)adWhirlView {
	
    //	[UIView beginAnimations:@"AdWhirlDelegate.adWhirlDidReceiveAd:"context:nil];
	
    //	[UIView setAnimationDuration:0.7];
    
	CGSize adSize = [adView actualAdSize];
	
	CGRect newFrame = adView.frame;
	newFrame.size = adSize;
	
	newFrame.origin.x = (self.view.bounds.size.width - adSize.width)/ 2;
	
	NSLog(@"%f",newFrame.origin.y);
	NSLog(@"%f",newFrame.origin.x);
    
	newFrame.origin.y=360;
	NSLog(@"%f",newFrame.origin.y);
    
	adView.frame = newFrame;
	NSLog(@"adview%f  %f",adView.frame.origin.x,adView.frame.origin.y);
	
    //	[UIView commitAnimations];
	
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
//- (void)loadView
//{
//    adView=[AdWhirlView requestAdWhirlViewWithDelegate:self];
//    [self.view addSubview:adView];
//}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
