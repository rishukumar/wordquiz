//
//  FirstViewController.m
//  wordquiz
//
//  Created by Saran on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "XMLReader.h"


@interface HomeViewController()
{
    NSString *filePath;
    UIAlertView * waitMessage;
    UIActivityIndicatorView  *activityIndicator;
}

- (NSString *)getFilePath;
-(void)updationIndicator;
-(void)beginDownload;
@end

@implementation HomeViewController

@synthesize homeTableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed: @"quitzerLOGO_05.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    self.navigationItem.titleView = imageView;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"bg.png"]];
    self.homeTableView.backgroundView = backgroundImageView;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    BOOL isAdwhirl = ((AppDelegate *)[UIApplication sharedApplication].delegate).adwhirlState;
    if(isAdwhirl)
    {
        [self.homeTableView setFrame:CGRectMake(0, 0, 320, 405)];
    }
    else
    {
        [self.homeTableView setFrame:CGRectMake(0, 0, 320, 460)];
    }
    
//    adView=[AdWhirlView requestAdWhirlViewWithDelegate:self];
//    [self.view addSubview:adView];
//    

    
	// Do any additional setup after loading the view, typically from a nib.
}
- (NSString *)getFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    filePath = [NSString stringWithFormat:@"%@/%@", [paths objectAtIndex:0],@"wordQuiz.sqlite"];   
    return filePath;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self getFilePath]])
    {
        [self updationIndicator];

    }
}
-(void)updationIndicator
{
  activityIndicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.frame=CGRectMake(125, 95, 30, 30);
    [activityIndicator startAnimating];
    
    waitMessage=[[UIAlertView alloc]initWithTitle:@"wordQuiz is downloading for the first time." message:@"This may take a few minutes..." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [waitMessage show];
    
    [waitMessage addSubview:activityIndicator];
    [self performSelector:@selector(beginDownload) withObject:nil afterDelay:0.1];
}
-(void)beginDownload
{
    
    XMLReader *xmlReaderInstance=[[XMLReader alloc]init];
    [xmlReaderInstance loadRecords];
    [activityIndicator stopAnimating];
    [waitMessage dismissWithClickedButtonIndex:0 animated:YES];
}- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
