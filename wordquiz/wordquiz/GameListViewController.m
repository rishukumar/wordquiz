//
//  GameListViewController.m
//  wordquiz
//
//  Created by John wesley moses on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameListViewController.h"
#import "CategoriesViewController.h"
#import "QuestionMaster.h"
#import "startQuizController.h"
#import <QuartzCore/CoreAnimation.h>
#import "QuestionGroup.h"
#import "Question.h"
@interface GameListViewController()

@property(nonatomic,strong) IBOutlet UITableView *questionNameView;

- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

@end

@implementation GameListViewController
@synthesize relationObjects,categoryName,questionNameView,relationCategoryID;

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed: @"quitzerLOGO_05.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    self.navigationItem.titleView = imageView;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"bg.png"]];
    self.questionNameView.backgroundView = backgroundImageView;

    relationObjects=[Question arrayQuestionsForCategoryRelationID:relationCategoryID];
    NSLog(@"relation objects %@",relationObjects);    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [relationObjects count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
 
    cell.textLabel.text = [[self.relationObjects objectAtIndex:indexPath.row]valueForKey:@"QuestionName"];

    cell.textLabel.textColor = [UIColor whiteColor];
    UIFont *myFont = [UIFont fontWithName:@"TrebuchetMS-Bold" size:21.f];
    cell.textLabel.font  = myFont;
 
    UIImage *originalImage =  [[UIImage alloc]initWithContentsOfFile:[[self.relationObjects objectAtIndex:indexPath.row]valueForKey:@"questionThumb"]];
    UIImage *resizedImage = [self imageWithImage:originalImage scaledToSize:CGSizeMake(45,45)];
    cell.imageView.image = resizedImage;
    if(originalImage == NULL)
    {
        cell.imageView.image = [UIImage imageNamed:@"noimage.png"];
    }
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 10.0;
    cell.imageView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    cell.imageView.layer.borderWidth = 0.9;
    cell.imageView.clipsToBounds = YES;

    return cell;
    
    
}
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize 
{
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"startgame"])
    {
        NSLog(@"The sender is %@",sender);
        NSIndexPath *indexPath = [self.questionNameView indexPathForCell:sender];
        QuestionMaster  *question= [self.relationObjects objectAtIndex:indexPath.row];
        startQuizController *startInstance  = [segue destinationViewController];
        [startInstance setQuestionImages:question.questionThumb];
        [startInstance setQuestionName:question.questionName];
        [startInstance setQuestionDesc:question.questionDescription];
        [startInstance setQuestionType:question.questionType];
        [startInstance setQuestionTimeLimit:question.timeLimit];
         [startInstance setQuestionID:question.questionID];
        //[startInstance setRelationObjectsForGroup:[question.questionGroupRelationship allObjects]];
      //  NSLog(@"group %@",[question.questionGroupRelationship allObjects]);
           
     
    }
}
-(void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    [self setTitle:categoryName];
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
