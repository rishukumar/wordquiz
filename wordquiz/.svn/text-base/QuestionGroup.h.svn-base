//
//  QuestionGroup.h
//  wordquiz
//
//  Created by John wesley moses on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class QuestionDetails;

@interface QuestionGroup : NSManagedObject

@property (nonatomic, strong) NSString * groupName;
@property (nonatomic, strong) NSNumber * groupID;
@property (nonatomic, strong) NSSet *groupDetailsRelationship;
@end

@interface QuestionGroup (CoreDataGeneratedAccessors)

- (void)addGroupDetailsRelationshipObject:(QuestionDetails *)value;
- (void)removeGroupDetailsRelationshipObject:(QuestionDetails *)value;
- (void)addGroupDetailsRelationship:(NSSet *)values;
- (void)removeGroupDetailsRelationship:(NSSet *)values;
@end
