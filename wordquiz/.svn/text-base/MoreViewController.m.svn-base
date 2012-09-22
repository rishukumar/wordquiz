//
//  MoreViewController.m
//  wordquiz
//
//  Created by Administrator on 02/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"
#import <MessageUI/MessageUI.h>
#import "Appirater.h"
#import <QuartzCore/CoreAnimation.h>
#import "AppDelegate.h"

@interface MoreViewController()

@property(nonatomic,strong) IBOutlet UIButton *feedback;
@property(nonatomic,strong) IBOutlet UIButton *rate;
@property(nonatomic,strong) IBOutlet UIButton *email;
@property(nonatomic,strong) IBOutlet UIButton *adfree;
@property(nonatomic,strong) IBOutlet UITableView *tableview;
@property(nonatomic,strong) IBOutlet UIBarButtonItem *home;

-(IBAction)email:(id)sender;
-(IBAction)feedback:(id)sender;
-(IBAction)rateApp:(id)sender;
-(void)goTohometab;

@end

@implementation MoreViewController
@synthesize feedback,rate,adfree,email,tableview,home;

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
    
    UIImage *image = [UIImage imageNamed: @"quitzerLOGO_05.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    self.navigationItem.titleView = imageView;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"bg.png"]];
    self.tableview.backgroundView = backgroundImageView;

    
    data = [NSMutableArray arrayWithObjects:
            @"Angry Birds", 
            @"Others app", 
            @"Others app", 
            
            nil];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(goTohometab)];
	self.navigationItem.leftBarButtonItem = nextButton;

}

-(IBAction)email:(id)sender
{
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
         [[mailer navigationBar] setTintColor:[UIColor blackColor]];
        
        mailer.mailComposeDelegate = self;
        [mailer setToRecipients:[NSArray arrayWithObject:@"contact@quitzer.com"]];
        [mailer setSubject:@"From Quitzer App"];
        NSString *emailBody = @"";
        [mailer setMessageBody:emailBody isHTML:NO];
        
        [self presentModalViewController:mailer animated:YES];
        
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure" 
                                                        message:@"Your device doesn't support the composer sheet" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles: nil];
        [alert show];
        
    }
    
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	switch (result)
	{
		case MFMailComposeResultCancelled:
			NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued");
			break;
		case MFMailComposeResultSaved:
			NSLog(@"Mail saved: you saved the email message in the Drafts folder");
			break;
		case MFMailComposeResultSent:
			NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send the next time the user connects to email");
			break;
		case MFMailComposeResultFailed:
			NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error");
			break;
		default:
			NSLog(@"Mail not sent");
			break;
	}
    
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)feedback:(id)sender
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        [[mailer navigationBar] setTintColor:[UIColor blackColor]];
        
        mailer.mailComposeDelegate = self;
        [mailer setToRecipients:[NSArray arrayWithObject:@"feedback@quitzer.com "]];
        [mailer setSubject:@"Feedback on Quitzer App!"];
        NSString *emailBody = @"";
        [mailer setMessageBody:emailBody isHTML:NO];
        
        [self presentModalViewController:mailer animated:YES];
        
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure" 
                                                        message:@"Your device doesn't support the composer sheet" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles: nil];
        [alert show];
        
    }
    
    
}
-(void)goTohometab
{

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UITabBarController *test=(UITabBarController*)appDelegate.window.rootViewController;
    test.selectedIndex=0;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *CellIdentifier = @"CellIdentifier";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    UIFont *myFont = [UIFont fontWithName:@"TrebuchetMS-Bold" size:21.f];
    cell.textLabel.font  = myFont;
    cell.imageView.image = [UIImage imageNamed:@"six.png"];
    
    cell.imageView.layer.cornerRadius = 10.0;
    cell.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    
    cell.imageView.layer.borderWidth = 1.2;
    cell.imageView.clipsToBounds = YES;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.frame = CGRectMake(10, 20, 60, 60);
     
    return cell;
}

-(IBAction)rateApp:(id)sender
{
    [Appirater appLaunched];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
