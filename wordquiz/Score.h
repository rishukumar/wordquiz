//
//  Score.h
//  wordquiz
//
//  Created by John wesley moses on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Score : NSManagedObject

@property (nonatomic, strong) NSNumber * score;
@property (nonatomic, strong) NSDate * testDate;
@property (nonatomic, strong) NSDate * timeTaken;
@property (nonatomic, strong) NSNumber * totalCount;
@property (nonatomic, strong) NSNumber * correct;
@property (nonatomic, strong) NSNumber * questionRelationID;

@end
