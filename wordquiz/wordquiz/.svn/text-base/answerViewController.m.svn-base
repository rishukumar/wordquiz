//
//  answerViewController.m
//  wordquiz
//
//  Created by John wesley moses on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "answerViewController.h"
#import "AdwhirlViewController.h"
#import "answerCustomCell.h"
#import "dataManager.h"
#import "GameStatusViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Answer.h"
#import "QuestionDetails.h"
#import "QuestionGroup.h"

@interface answerViewController()
{
    NSDate *startDate;
    NSTimer *watchTimer;
    answerCustomCell *cell;
    NSMutableArray *givenAnswers;
    NSMutableArray *correctAnswers;
    NSTimeInterval totalTime;
    NSNumber *groupRelationIDForGroupName;
    NSMutableArray *exampleArray;
    NSMutableArray *copyArray;
    NSMutableArray *arrayAnswer;
    NSMutableDictionary *totalDict;
    NSInteger correctAnswerCount;
    NSString *answers;
    NSMutableArray *scrollAnswers;
    
    NSMutableArray *totalArray;
    
    BOOL iscorrect;

 
}


@property(nonatomic,strong)IBOutlet UILabel *groupLabel;

@property(nonatomic,strong)IBOutlet UITableView *answerTableView;

@property(nonatomic,strong) IBOutlet UITextField        *textField;
@property(nonatomic,strong) IBOutlet UIToolbar			*toolbar;
@property(nonatomic,strong) IBOutlet UIBarButtonItem	*textFieldBarButtonItem;
@property(nonatomic,strong) IBOutlet UIBarButtonItem	*goBarButtonItem;
@property(nonatomic,strong) IBOutlet UIBarButtonItem	*doneBarButtonItem;
@property(nonatomic,strong) IBOutlet UIBarButtonItem    *statsBarButtonItem;

@property(nonatomic,strong)NSArray *groupRelationObjects;

@property(nonatomic,strong)NSString *answer;
@property(nonatomic,strong)NSString *alternateAnswer;
@property(nonatomic,strong)NSString *refernceText;

@property(nonatomic,strong)IBOutlet UIScrollView *scrollView;

@property(nonatomic,strong)NSMutableArray *groupArray;
@property(nonatomic,strong)NSMutableArray *referenceArray;

@property(nonatomic)BOOL isGiveUp;
@property(nonatomic)BOOL isScrolling;

- (IBAction)go:(id)sender;

- (void)timerFired:(NSTimer *)timer;
- (void)clearCountDownTimer;
- (IBAction)giveUp:(id)sender;
- (void)scrollAnswer:(NSString *) userAnswer;


@end

int timerCount;

@implementation answerViewController

@synthesize toolbar = _toolbar;
@synthesize textField = _textField;
@synthesize textFieldBarButtonItem = _textFieldBarButtonItem;
@synthesize goBarButtonItem = _goBarButtonItem;
@synthesize doneBarButtonItem = _doneBarButtonItem;
@synthesize statsBarButtonItem = _statsBarButtonItem;
@synthesize answerTableView = _answerTableView;
@synthesize scrollView;
@synthesize questionType,questionTimeLimit;
@synthesize groupName;
@synthesize answer,alternateAnswer,refernceText,groupLabel,gameName;
@synthesize isGiveUp;
@synthesize questionRelationID;
@synthesize isScrolling;
@synthesize clue;
@synthesize autoScrollLabel;


@synthesize groupArray,referenceArray,answerRelationObjects,groupRelationObjects;

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
    
    totalDict=[[NSMutableDictionary alloc]init];
    givenAnswers = [NSMutableArray array];
    scrollAnswers = [NSMutableArray array];
    correctAnswers = [NSMutableArray array];
    copyArray=[[NSMutableArray alloc]init];
     exampleArray=[[NSMutableArray alloc]init];
   totalArray = [[NSMutableArray alloc]init];
  
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];  
    startDate = [NSDate date];
    
    [self.navigationItem setHidesBackButton:YES];
    
    self.tabBarController.tabBar.userInteractionEnabled=NO;
    self.navigationController.navigationBar.userInteractionEnabled=NO;
    
    
    self.answerRelationObjects=[Answer arrayAnswerForQuestionRelationID:questionRelationID];
    copyArray=[self.answerRelationObjects mutableCopy];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    for(QuestionDetails *groupRelationID in answerRelationObjects)
    {

        NSArray *arrayOfGroups =[Answer groupNameForGroupRelationID:groupRelationID.groupRelationID];

            for(QuestionGroup *groupRef in arrayOfGroups)
            {
                if(![exampleArray containsObject:groupRef.groupName])
                {
                    [exampleArray addObject:groupRef.groupName];   
                    NSLog(@"group name %@",groupRef.groupName);
                }
            
            }
       
    }

    NSInteger count = 0;
    arrayAnswer=[[NSMutableArray alloc]init];
    
    if([exampleArray count]!=0)
    {
        for(int i=0;i<[exampleArray count];i++)
        {
            NSArray *arrayOfGroups =[Answer groupIdForGroupRelationName:[exampleArray objectAtIndex:i]];
                arrayAnswer=[NSMutableArray array];

            NSInteger answerCount=0;
            for(QuestionGroup *groupRef in arrayOfGroups)
            {

                for(QuestionDetails *questionGroup in answerRelationObjects)
                {    
                    
                    NSString *grouID=[NSString stringWithFormat:@"%@",groupRef.groupID];
                    NSString *detailsID=[NSString stringWithFormat:@"%@",questionGroup.groupRelationID];

                    if([grouID isEqualToString:detailsID])
                    {
                        [arrayAnswer addObject:questionGroup];
                       
                        answerCount++;
                    }

                
                               
                }
            }
            [dict setObject:arrayAnswer forKey:[exampleArray objectAtIndex:i]];
            arrayAnswer = nil;
            [totalArray addObject:dict];    
               
        }

    }
    
    else
    {
        [exampleArray addObject:@""];
        NSMutableDictionary *answerDict = [[NSMutableDictionary alloc]init];
        
     
        for(QuestionDetails *groupRelation in answerRelationObjects)
        {
            [arrayAnswer addObject:groupRelation];
            count++;
            NSLog(@"arrayanswers %@",arrayAnswer);
        }
        [answerDict setObject:arrayAnswer forKey:@""];
        arrayAnswer = nil;
        [totalArray addObject:answerDict];
        

    }

 
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
	[center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    _toolbar.items = [NSArray arrayWithObjects:_textFieldBarButtonItem,_doneBarButtonItem,nil];
  
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"bg.png"]];
    _answerTableView.backgroundView = backgroundImageView;
    
    watchTimer = [NSTimer timerWithTimeInterval:1.00 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] ;
    [[NSRunLoop currentRunLoop] addTimer:watchTimer forMode:NSDefaultRunLoopMode];
       
    timerCount =[self.questionTimeLimit integerValue];
    
    self.isGiveUp = FALSE;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(go:) name:UITextFieldTextDidChangeNotification object:_textField];
    
       autoScrollLabel.text = self.clue;
    autoScrollLabel.textColor = [UIColor yellowColor];



}


-(IBAction)giveUp:(id)sender
{
    UIAlertView *giveupAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Are you sure going to giveup" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    [giveupAlert show];
    [_textField resignFirstResponder];

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        self.isGiveUp = TRUE;
       
        _toolbar.items = [NSArray arrayWithObject:_statsBarButtonItem];
        
        for(answers in givenAnswers)
        {
            NSLog(@"answers %@",answers);
            if([answers length]!=0)
            {
                if(![correctAnswers containsObject:answers])
                {
                    [correctAnswers addObject:answers];
                }
            }
        }


        correctAnswerCount = [correctAnswers count];
        NSLog(@"count of answers %d",[correctAnswers count]);
        self.tabBarController.tabBar.userInteractionEnabled=YES;
        self.navigationController.navigationBar.userInteractionEnabled=YES;
        NSIndexPath *indexpathToScroll = [NSIndexPath indexPathForRow:cell.answerLabel.tag inSection:0];
        [self.answerTableView reloadData];
        [self.answerTableView scrollToRowAtIndexPath:indexpathToScroll atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        [watchTimer invalidate];
        watchTimer = nil;   
        self.navigationItem.title = [NSString stringWithFormat:@"%d:%02d",0,0];
    }
}
-(void) clearCountDownTimer 
{
    [watchTimer invalidate];
    watchTimer = nil;
    UIAlertView *timerAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Maximum time limit reached" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [timerAlert show];
     _toolbar.items = [NSArray arrayWithObject:_doneBarButtonItem];

}

-(void)timerFired:(NSTimer *)timer
{

    if(timerCount == 0){
    [self clearCountDownTimer];
    } else {
        timerCount--;
        if(timerCount == 0) {
            [self clearCountDownTimer];
        }
    }
    self.navigationItem.title = [NSString stringWithFormat:@"%d:%02d",timerCount/60,timerCount%60];
    if(timerCount == 10.00)
    {
               
        NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"beep" ofType:@"wav"];
        
        SystemSoundID soundID;
        
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundPath], &soundID);
        AudioServicesPlaySystemSound(soundID);
        
        UIAlertView *timerAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Hurry Up!Remaining 10seconds" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [timerAlert show];

    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)keyboardWillShow:(NSNotification *)notification 
{
	double animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	
	CGRect keyboardBounds = [(NSValue *)[[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	
	[UIView beginAnimations:@"showKeyboardAnimation" context:nil];
	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	NSLog(@"keyboard height %f",keyboardBounds.size.height);
    self.view.frame = CGRectMake(0,0,self.view.frame.size.width,465 - keyboardBounds.size.height);
    
    NSLog(@"keyboard height %f",keyboardBounds.size.height);
    CGRect textFieldFrame = _textField.frame;
    textFieldFrame.size.width = keyboardBounds.size.width - 36.0 - 100.0;
	_textField.frame = textFieldFrame;
	_toolbar.items = [NSArray arrayWithObjects:_textFieldBarButtonItem,_doneBarButtonItem,nil];
    
    
	[UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)notification 
{
   
	double animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	
	CGRect keyboardBounds = [(NSValue *)[[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	
	[UIView beginAnimations:@"hideKeyboardAnimation" context:nil];
	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
    NSLog(@"keyboard height %f",keyboardBounds.size.height);
        //self.view.frame = CGRectMake(0,0,self.view.frame.size.width,300 + keyboardBounds.size.height);
    self.view.frame = CGRectMake(0,0,self.view.frame.size.width,580 - keyboardBounds.size.height);
    
    NSLog(@"keyboard height %f",keyboardBounds.size.height);
    
    CGRect textFieldFrame = _textField.frame;
	textFieldFrame.size.width = keyboardBounds.size.width - 36.0 - 100.0;
	_textField.frame = textFieldFrame;
	_toolbar.items = [NSArray arrayWithObjects:_textFieldBarButtonItem,_doneBarButtonItem,nil];
	
	[UIView commitAnimations];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"gameStatus"])
    {
        [_textField resignFirstResponder];
        [watchTimer invalidate];
        watchTimer = nil;
        GameStatusViewController *gameStatus  = [segue destinationViewController];
        [gameStatus setGame:self.gameName];
        [gameStatus setAnswers:self.answerRelationObjects];
         NSUInteger totalCount = [self.answerRelationObjects count];
        [gameStatus setTotalCountAnswers:totalCount];
        [gameStatus setTotalCountCorrectAnswers:[scrollAnswers count]];
        NSLog(@"scroll answers count %d",[scrollAnswers count]);

    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [totalArray count];
 
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableDictionary * dictForAnswer = [totalArray objectAtIndex:section];
    NSArray *array = [dictForAnswer objectForKey:[exampleArray objectAtIndex:section]];
    NSLog(@"%d",[array count]);
    return [array count];

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{

    return [exampleArray objectAtIndex:section];

    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"answerCell";
    
    
    
    cell= (answerCustomCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        
        NSArray *topLevelObjects = [[NSBundle mainBundle]loadNibNamed:@"answerCustomCell" owner:self options:nil];
        
        for(id currrentObject in topLevelObjects)
        {
            if([currrentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (answerCustomCell*)currrentObject;
                break;
            }
        }
    }
    cell.isRevealAnswer = FALSE;
    
    
    NSMutableDictionary *dictioanary = [totalArray objectAtIndex:indexPath.section];
    NSArray *array = [dictioanary objectForKey:[exampleArray objectAtIndex:indexPath.section]];
    NSManagedObject *currentAnswer=[array objectAtIndex:indexPath.row];
    NSLog(@"array answers %@",[currentAnswer valueForKey:@"answer"]);
    cell.answerLabel.text = [currentAnswer valueForKey:@"answer"];
    cell.referenceLabel.text =[currentAnswer valueForKey:@"referenceText"];
    cell.answerLabel.textColor = [UIColor lightGrayColor];
    
    [_textField addObserver:cell forKeyPath:@"text" options:(NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew) context:@"mycontext"];  

    
       for(answers in givenAnswers)
       {
           if([answers caseInsensitiveCompare:cell.answerLabel.text] == NSOrderedSame)
           {
               
                [cell revealAnswer];
               break;
           }
           else
           {
               cell.answerLabel.textColor = [UIColor lightGrayColor];
           }
       }
        
    if(self.isGiveUp == TRUE)
    {
        if(cell.isRevealAnswer == TRUE)
        {
            
            cell.answerLabel.textColor = [UIColor blackColor];
            iscorrect = YES;

        }
        else	
        {
            cell.answerLabel.textColor = [UIColor redColor];
        }
    }
    return cell;

}

-(void)scrollAnswer:(NSString*)userAnswer
{
    int selectedRow=0;
    int selectedSection=0;
    NSUInteger index = [totalArray indexOfObject:answers];
     int i=0;
    for(NSMutableDictionary * dict in totalArray){
        NSMutableArray *innerArray =[dict objectForKey:[exampleArray objectAtIndex:i]];
       
       
        int j=0;
        for(NSManagedObject *obj in innerArray){
       
            if([[obj valueForKey:@"answer"] caseInsensitiveCompare:userAnswer]==NSOrderedSame){
                   NSLog(@" Row count %d",j);
                [scrollAnswers addObject:userAnswer];
                selectedRow=j;
                selectedSection=i;
            }
            j++;
        }
                 
            NSLog(@" Section Count %d",i);
        i++;

    }
    NSLog(@"index value %d",index);
    NSIndexPath *indexpathToScroll = [NSIndexPath indexPathForRow:selectedRow inSection:selectedSection];
    [self.answerTableView reloadData];
    [self.answerTableView scrollToRowAtIndexPath:indexpathToScroll atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == _textField)
    {
        [_textField resignFirstResponder];
    }
    return YES;
}
//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    _textField = textField;
//    if(![givenAnswers containsObject:_textField.text])
//    {
//        [givenAnswers addObject:_textField.text];
//        
//    }
//    [self scrollAnswer:_textField.text];
//    
//    return YES;
//}


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

- (IBAction)go:(id)sender
{
    if([_textField.text length]!=0)
    {
    
        if(![givenAnswers containsObject:_textField.text])
        {
            [givenAnswers addObject:_textField.text];
            self.isScrolling = YES;
        
            [self scrollAnswer:_textField.text];
        
        }
    }

}

@end