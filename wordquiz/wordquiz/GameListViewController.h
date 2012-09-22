//
//  GameListViewController.h
//  wordquiz
//
//  Created by John wesley moses on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *relationObjects;
@property(nonatomic,strong)NSString *categoryName;
@property(nonatomic,strong)NSNumber *relationCategoryID;

@end
