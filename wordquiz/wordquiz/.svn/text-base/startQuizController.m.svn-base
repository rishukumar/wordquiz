//
//  startQuizController.m
//  wordquiz
//
//  Created by John wesley moses on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "startQuizController.h"
#import "answerViewController.h"
#import "QuestionGroup.h"
#import "QuestionDetails.h"

@implementation startQuizController
@synthesize questionDesc,questionType,questionTimeLimit,questionName,questionImages,questionID;
@synthesize questionObjects,groupDetails;

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    questionImage.image=[[UIImage alloc]initWithContentsOfFile:self.questionImages];
    if(questionImage.image == NULL)
    {
        questionImage.image = [UIImage imageNamed:@"noimage.png"];
    }
    questionNames.text=self.questionName;
    questionNames.textColor = [UIColor whiteColor];
    questionNames.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:21.f];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed: @"quitzerLOGO_05.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    self.navigationItem.titleView = imageView;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
       
     [questionDescription setText:self.questionDesc];
    [questionDescription setTextColor:[UIColor whiteColor]];
    [questionDescription setFont:[UIFont fontWithName:@"TrebuchetMS" size:18.f]];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"answersegue"])
    {
        answerViewController *answerInstance  = [segue destinationViewController];
        [answerInstance setQuestionType:self.questionType];
        [answerInstance setQuestionTimeLimit:self.questionTimeLimit];
       // [answerInstance setGameName:self.questionName];
        [answerInstance setQuestionRelationID:self.questionID];
        [answerInstance setClue:self.questionDesc];
        NSLog(@"guestion relation id:%d",[self.questionID intValue]);
       // QuestionGroup *group = [self.relationObjectsForGroup objectAtIndex:0];
      //  self.groupDetails= [group.groupDetailsRelationship allObjects];
      //  [answerInstance setAnswerRelationObjects:self.groupDetails];
      //  [answerInstance setGroupName:group.groupName];
        
      //  NSLog(@"group name%@",group.groupName);
        
     //   NSLog(@"groupDetails %@",self.relationObjectsForAnswers);
      //   NSLog(@"groupDetails %@",self.relationObjectsForGroup);
            
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
