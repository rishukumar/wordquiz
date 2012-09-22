//
//  answerViewController.h
//  wordquiz
//
//  Created by John wesley moses on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoScrollLabel.h"

@interface answerViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>

{
    NSTimer *timer;
}
@property(nonatomic,strong)NSNumber *questionType;
@property(nonatomic,strong)NSNumber *questionTimeLimit;
@property(nonatomic,strong)NSNumber *questionRelationID;
@property(nonatomic,strong)NSArray *answerRelationObjects;
@property(nonatomic,strong)NSString *gameName;
@property(nonatomic,strong)NSString *groupName;
@property(nonatomic,strong)NSString *clue;
@property(nonatomic,strong)IBOutlet AutoScrollLabel *autoScrollLabel;

@end
