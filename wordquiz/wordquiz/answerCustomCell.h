//
//  answerCustomCell.h
//  wordquiz
//
//  Created by Administrator on 25/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface answerCustomCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *groupLabel;
@property (nonatomic, strong) IBOutlet UILabel *answerLabel;
@property (nonatomic, strong) IBOutlet UILabel *referenceLabel;

@property (nonatomic)BOOL isRevealAnswer;
@property (nonatomic)BOOL isScrolling;

-(void)revealAnswer;

@end
