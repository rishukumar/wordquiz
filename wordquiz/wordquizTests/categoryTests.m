//
//  categoryTests.m
//  wordQuizLibrary
//
//  Created by Saran on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "categoryTests.h"

#import "Category.h"
#import "CategoryMaster.h"


@implementation categoryTests

// All code under test must be linked into the Unit Test bundle
- (void)testAllCategories
{
    STAssertNoThrow([Category categories], @"Shouldn't throw any exception");
    NSArray *allCategories = [Category categories];
    STAssertNotNil(allCategories, @"All categories array cannot be nil");
    
    STAssertTrue([allCategories count] == 5, @"All categories count should be 5");
    
    for (NSManagedObject *category in allCategories) {
        NSString *entityName = category.entity.name;       
        STAssertTrue([entityName isEqualToString:@"CategoryMaster"],  @"Category array having non Category types");
    }
    
}

- (void)testcategoryByName
{
    id category = [Category categoryByName:@"Business"];
    STAssertTrue([category isKindOfClass:[NSManagedObject class]], @"Category by name is returning non Category type");
    
    category = [Category categoryByName:@"business"];
    STAssertNotNil(category, @"Not retrieving category when given improper case category name");
    
}

@end
