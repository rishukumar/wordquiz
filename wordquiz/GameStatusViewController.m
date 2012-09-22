//
//  GameStatusViewController.m
//  wordquiz
//
//  Created by Administrator on 30/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameStatusViewController.h"
#import "startQuizController.h"
#import "AppDelegate.h"
#import "GameStatusCustomCell.h"

@interface GameStatusViewController() 

@property(strong,nonatomic)IBOutlet UITableView *statusTableView;
@property (nonatomic, strong) IBOutlet UILabel *gameName;
@property (nonatomic, strong) IBOutlet UILabel *playedTimes;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;

-(IBAction)playAgain:(id)sender;

@end

@implementation GameStatusViewController
@synthesize statusTableView;
@synthesize gameName,playedTimes,scoreLabel,game,answers;
@synthesize totalCountAnswers,totalCountCorrectAnswers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = @"Game Stats";
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"bg.png"]];
    self.statusTableView.backgroundView = backgroundImageView;
    
    self.tabBarController.tabBar.userInteractionEnabled=YES;
    self.navigationController.navigationBar.userInteractionEnabled=YES;
    
    self.navigationItem.hidesBackButton = YES;

    
    gameName.text = self.game;
    
    NSString *answerCount = [NSString stringWithFormat:@"%d",self.totalCountAnswers];
    NSString *correctAnswerCount = [NSString stringWithFormat:@"%d",self.totalCountCorrectAnswers];
    
    NSMutableString *score = [correctAnswerCount mutableCopy];
    [score appendString:@"/"];
    [score appendString:answerCount];
    [score appendString:@" "];
    [score appendString:@"correct"];
    self.scoreLabel.text = score;

    
}


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
-(IBAction)playAgain:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UITabBarController *tab=(UITabBarController*)appDelegate.window.rootViewController;
    if(tab.selectedIndex == 1)
    {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    }
    else if(tab.selectedIndex == 2)
    {
         [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES]; 
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.answers count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"statusCell";
    
    GameStatusCustomCell *cell= (GameStatusCustomCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        
        NSArray *topLevelObjects = [[NSBundle mainBundle]loadNibNamed:@"GameStatusCustomCell" owner:self options:nil];
        
        for(id currrentObject in topLevelObjects)
        {
            if([currrentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (GameStatusCustomCell*)currrentObject;
                break;
            }
        }
    }
    cell.answerLabel.text = [[self.answers objectAtIndex:indexPath.row]valueForKey:@"answer"];
       
    return cell;
    
    
}
@end
