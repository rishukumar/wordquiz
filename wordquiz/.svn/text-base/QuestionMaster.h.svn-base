//
//  QuestionMaster.h
//  wordquiz
//
//  Created by John wesley moses on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class QuestionGroup, Score;

@interface QuestionMaster : NSManagedObject

@property (nonatomic, strong) NSString * questionDescription;
@property (nonatomic, strong) NSString * questionName;
@property (nonatomic, strong) NSNumber * questionType;
@property (nonatomic, strong) NSNumber * timeLimit;
@property (nonatomic, strong) NSNumber * questionID;
@property (nonatomic, strong) NSString * categoryRelationID;

@property (nonatomic, strong)NSString *questionThumb;
@property (nonatomic, strong) NSSet *questionGroupRelationship;
@property (nonatomic, strong) NSSet *questionScoreRelationship;
@end

@interface QuestionMaster (CoreDataGeneratedAccessors)

- (void)addQuestionGroupRelationshipObject:(QuestionGroup *)value;
- (void)removeQuestionGroupRelationshipObject:(QuestionGroup *)value;
- (void)addQuestionGroupRelationship:(NSSet *)values;
- (void)removeQuestionGroupRelationship:(NSSet *)values;
- (void)addQuestionScoreRelationshipObject:(Score *)value;
- (void)removeQuestionScoreRelationshipObject:(Score *)value;
- (void)addQuestionScoreRelationship:(NSSet *)values;
- (void)removeQuestionScoreRelationship:(NSSet *)values;
@end
