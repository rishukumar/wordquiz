//
//  CategoryMaster.h
//  wordquiz
//
//  Created by John wesley moses on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class QuestionMaster;

@interface CategoryMaster : NSManagedObject

@property (nonatomic, strong) NSString * categoryName;
@property (nonatomic, strong) NSNumber * categoryID;
@property (nonatomic, strong) NSSet *categoryQuestionRelationship;
@end

@interface CategoryMaster (CoreDataGeneratedAccessors)

- (void)addCategoryQuestionRelationshipObject:(QuestionMaster *)value;
- (void)removeCategoryQuestionRelationshipObject:(QuestionMaster *)value;
- (void)addCategoryQuestionRelationship:(NSSet *)values;
- (void)removeCategoryQuestionRelationship:(NSSet *)values;
@end
