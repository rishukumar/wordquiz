//
//  SecondViewController.m
//  wordquiz
//
//  Created by Saran on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"
#import "Question.h"
#import "QuestionMaster.h"
#import "startQuizController.h"
#import <QuartzCore/CoreAnimation.h>
#import "AppDelegate.h"

@interface SearchViewController()

@property (nonatomic, strong) IBOutlet UITableView *searchingTableView;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *questionsFilteredArray;
@property (nonatomic, strong) NSArray *questionsArray;

-(void)doSearch:(NSString *)searchText;
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize; 

@end

@implementation SearchViewController

@synthesize searchBar,searchingTableView;
@synthesize questionsFilteredArray;
@synthesize questionsArray;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(NSArray *)getFilteredArrayForSearchText:(NSString*)searchText
{
    NSArray *returnArray;
    if (searchText != nil && searchText.length > 0) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"(questionName contains[cd] %@)", searchText];
        returnArray = [self.questionsArray filteredArrayUsingPredicate:searchPredicate];
    }
    else
    {
        returnArray = [self.questionsArray copy];
    }
    
    return returnArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    UIImage *image = [UIImage imageNamed: @"quitzerLOGO_05.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    self.navigationItem.titleView = imageView;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"bg.png"]];
    self.searchingTableView.backgroundView = backgroundImageView;

    searchBar.delegate = self;
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    self.questionsArray=[Question arrayQuestions];
    
    BOOL isAdwhirl = ((AppDelegate *)[UIApplication sharedApplication].delegate).adwhirlState;
    if(isAdwhirl)
    {
        [self.searchingTableView setFrame:CGRectMake(0, 40, 320, 375)];
    }
    else
    {
        [self.searchingTableView setFrame:CGRectMake(0, 40, 320, 420)];
    }

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setSearchBar:nil];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.questionsFilteredArray = [self getFilteredArrayForSearchText:nil];
    if(self.searchBar.text != nil)
    {
    [self doSearch:searchBar.text];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
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

#pragma mark - Table view data source methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.questionsFilteredArray.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    
    QuestionMaster *gamesQuestion= [self.questionsFilteredArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [gamesQuestion valueForKey:@"questionName"];
    cell.textLabel.textColor = [UIColor whiteColor];
    UIFont *myFont = [UIFont fontWithName:@"TrebuchetMS-Bold" size:21.f];
    cell.textLabel.font  = myFont;

    UIImage *originalImage = [[UIImage alloc]initWithContentsOfFile:[gamesQuestion valueForKey:@"questionThumb"]];
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
    if([[segue identifier]isEqualToString:@"showQuiz"])
    {
        NSLog(@"The sender is %@",sender);
        NSIndexPath *indexPath = [self.searchingTableView indexPathForCell:sender];
        QuestionMaster *question = [self.questionsFilteredArray objectAtIndex:indexPath.row];
        startQuizController *startGame = [segue destinationViewController];
        NSLog(@"Question Description %@",question.questionDescription);
        [startGame setQuestionDesc:question.questionDescription];
        [startGame setQuestionType:question.questionType];
        [startGame setQuestionTimeLimit:question.timeLimit];
        [startGame setQuestionName:question.questionName];
        [startGame setQuestionImages:question.questionThumb];
     //   [startGame setRelationObjectsForGroup:[question.questionGroupRelationship allObjects]];
          [startGame setQuestionID:question.questionID];
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    [self.searchBar setShowsCancelButton:YES animated:YES];
    self.searchingTableView.allowsSelection=YES;
    self.searchingTableView.scrollEnabled=YES;
    
}

-(void)doSearch:(NSString *)searchText
{
    self.questionsFilteredArray = [self getFilteredArrayForSearchText:searchText];
    [self.searchingTableView reloadData];
    if (self.questionsFilteredArray.count == 0) {
        UIAlertView *showalert=[[UIAlertView alloc]initWithTitle:@"No Results" message:@"No games matches your criteria" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [showalert show];
        
    }else{
        [self.searchingTableView reloadData];
    }

}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self doSearch:searchText];

}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    self.searchBar.text = @"";
    [self.searchBar resignFirstResponder];
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
    self.searchingTableView.allowsSelection=YES;
    searchingTableView.scrollEnabled=YES;
    self.questionsFilteredArray = [self getFilteredArrayForSearchText:nil];
    [self.searchingTableView reloadData];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
    [self.searchBar setHidden:NO];
    
}

#pragma mark - serch bar delegate methods
@end
