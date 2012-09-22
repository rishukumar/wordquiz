//
//  QuestionDetails.h
//  wordquiz
//
//  Created by John wesley moses on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface QuestionDetails : NSManagedObject

@property (nonatomic, strong) NSString * alternateAnswer;
@property (nonatomic, strong) NSString * answer;
@property (nonatomic, strong) NSString * referenceText;

@property (nonatomic, strong) NSNumber * questionRelationID;
@property (nonatomic, strong) NSNumber * groupRelationID;

@end
