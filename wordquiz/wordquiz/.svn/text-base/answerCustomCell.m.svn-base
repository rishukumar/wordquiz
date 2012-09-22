//
//  answerCustomCell.m
//  wordquiz
//
//  Created by Administrator on 25/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "answerCustomCell.h"
#import "answerViewController.h"


@implementation answerCustomCell

@synthesize groupLabel = _groupLabel;
@synthesize answerLabel = _answerLabel;
@synthesize referenceLabel = _referenceLabel;
@synthesize isRevealAnswer;
@synthesize isScrolling;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)revealAnswer
{
    self.answerLabel.textColor = [UIColor blackColor];
       self.isRevealAnswer = TRUE;
    self.isScrolling = TRUE;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];

    NSLog(@"OldValue %@",oldValue);
    NSLog(@"NewValue %@",newValue);
    
    if( [newValue caseInsensitiveCompare:self.answerLabel.text] == NSOrderedSame)
    {
        [self revealAnswer];
            // [self.scrollTableView scrollToRowAtIndexPath:self.scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES]; 

    }
   
//    if([newValue isEqualToString:self.answerLabel.text])
//    {
//        [self revealAnswer];
//    }
    
}

@end
