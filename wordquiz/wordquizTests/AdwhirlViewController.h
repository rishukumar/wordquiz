//
//  AdwhirlViewController.h
//  wordquiz
//
//  Created by John wesley moses on 16/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdWhirlView.h"
#import "AdWhirlDelegateProtocol.h"

@interface AdwhirlViewController : UITabBarController<AdWhirlDelegate>

@property(nonatomic,strong)AdWhirlView *adView;
@end
