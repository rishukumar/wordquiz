//
//  dataManagerTests.m
//  wordQuizLibrary
//
//  Created by Administrator on 05/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dataManagerTests.h"
#import "dataManager.h"
#import <objc/runtime.h>



@implementation dataManagerTests

-(void)testCreateManagedObjectContext
{
    NSManagedObjectContext *dataContext;
    STAssertNoThrow(dataContext = [dataManager managedObjectContext], @"Getting managedObjectConect Should not throw exception");
        
    dataContext = [dataManager managedObjectContext];
   
        STAssertNotNil(dataContext,@"Not nil");
        STAssertTrue([dataContext isKindOfClass:[NSManagedObjectContext class]],@"Data context is not of type NSManagedObjectContext");
}

- (void)testPresenceOfUnwantedInterfaces
{


}

- (void)setUp
{
}

- (void)tearDown
{
}


@end
