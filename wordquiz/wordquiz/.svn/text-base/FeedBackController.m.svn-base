//
//  FeedBackController.m
//  wordquiz
//
//  Created by Muthu Sankara.P on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedBackController.h"
#import <QuartzCore/QuartzCore.h>

@interface FeedBackController()

@property(nonatomic,strong) IBOutlet UITextField *emailTextField;
@property(nonatomic,strong) IBOutlet UITextField *nameTextField;
@property(nonatomic,strong) IBOutlet UITextView *commentsTextView;
@property(nonatomic,strong) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong) IBOutlet UITextField *activeField;
@property(nonatomic,strong) IBOutlet UITextView *activeView;

-(BOOL)isFormDataValid;
-(IBAction)submit:(id)sender;
- (BOOL) validateEmail: (NSString *) candidate;


@end

@implementation FeedBackController
@synthesize emailTextField,commentsTextView,nameTextField,scrollView,activeField,activeView;

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



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = @"Feedback";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];

    self.commentsTextView.layer.borderWidth = 1.0f;
    
    self.commentsTextView.layer.borderColor = [[UIColor grayColor] CGColor]; 
}
#pragma mark - View lifecycle

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.nameTextField)
    {
        [self.emailTextField becomeFirstResponder];
    }
    else if(textField == self.emailTextField)
    {
        [self.commentsTextView becomeFirstResponder];
    }
    else
    {
        [self.activeField resignFirstResponder];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3f];
        [self.scrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
        [UIView commitAnimations];
    }
    
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    [self.scrollView setContentOffset:CGPointMake(0.0, self.activeField.frame.origin.y-92) animated:YES];
    [UIView commitAnimations];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    self.activeView = textView;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    [self.scrollView setContentOffset:CGPointMake(0.0, self.activeView.frame.origin.y-92) animated:YES];
    [UIView commitAnimations];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    self.activeView = nil;
    [self.scrollView setContentOffset:CGPointMake(0.0, self.activeView.frame.origin.y-10) animated:YES];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
    
}
-(BOOL)isFormDataValid{
    
    NSString *errorMessage = nil;
    UITextField *errorField;
    
    if([nameTextField.text isEqualToString:@""])
    {
        errorMessage = @"Please enter your name";
        errorField = nameTextField;
    }
    else if([emailTextField.text isEqualToString:@""])
    {
        errorMessage = @"Please enter your email id";
        errorField = emailTextField;
    }
    else if([self validateEmail:[emailTextField text]] == 0)
    {
        errorMessage = @"Please enter your correct email id";
        errorField = emailTextField;
    }
    else if([[commentsTextView text] length] == 0)
    {
        errorMessage = @"Please enter your comments";
        [commentsTextView becomeFirstResponder];
    }
    if (errorMessage) 
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed!" message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [errorField becomeFirstResponder];
        return NO;
    }else{
        return YES;
    }
    
}
- (BOOL) validateEmail: (NSString *) candidate 
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}
-(IBAction)submit:(id)sender
{
    if ([self isFormDataValid]) 
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you" message:@"Submitted Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
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
