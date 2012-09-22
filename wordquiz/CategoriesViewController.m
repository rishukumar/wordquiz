//
//  CategoriesViewController.m
//  wordquiz
//
//  Created by Administrator on 02/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CategoriesViewController.h"
#import "Category.h"
#import "GameListViewController.h"
#import "CategoryMaster.h"
#import "AppDelegate.h"


@interface   CategoriesViewController() 

@property(nonatomic,strong)IBOutlet UITableView *categoryTableView;
@property(nonatomic,strong)NSArray *categoryObjects;
@property(nonatomic,strong)NSArray *relationshipDetails;
@property(nonatomic,strong)NSNumber *relationID;
@end

@implementation CategoriesViewController
@synthesize categoryObjects,categoryTableView,relationshipDetails,relationID;


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
    
    UIImage *image = [UIImage imageNamed: @"quitzerLOGO_05.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    self.navigationItem.titleView = imageView;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"bg.png"]];
    self.categoryTableView.backgroundView = backgroundImageView;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    // Do any additional setup after loading the view from its nib.
    
    BOOL isAdwhirl = ((AppDelegate *)[UIApplication sharedApplication].delegate).adwhirlState;
    if(isAdwhirl)
    {
        [self.categoryTableView setFrame:CGRectMake(0, 0, 320, 405)];
    }
    else
    {
        [self.categoryTableView setFrame:CGRectMake(0, 0, 320, 460)];
    }

}
-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
    self.categoryObjects=[Category categories];
    NSLog(@"values %@",categoryObjects);

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [categoryObjects count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    
    cell.textLabel.text = [[self.categoryObjects objectAtIndex:indexPath.row]valueForKey:@"CategoryName"];

    cell.textLabel.textColor = [UIColor whiteColor];
    UIFont *myFont = [UIFont fontWithName:@"TrebuchetMS-Bold" size:21.f];
    cell.textLabel.font  = myFont;
    
 
    return cell;
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"games"])
    {
        NSLog(@"The sender is %@",sender);
        NSIndexPath *indexPath = [self.categoryTableView indexPathForCell:sender];
        CategoryMaster  *categoryName = [self.categoryObjects objectAtIndex:indexPath.row];
        GameListViewController *gameInstance  = [segue destinationViewController];
        relationID = categoryName.categoryID;
        NSLog(@"relation %@",relationID);
        [gameInstance setRelationCategoryID:relationID];
        [gameInstance setCategoryName:categoryName.categoryName];
    }
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

@end
