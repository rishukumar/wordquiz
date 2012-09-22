//
//  Category.m
//  wordQuizLibrary
//
//  Created by Saran on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Category.h"
#import "dataManager.h"
#import "CategoryMaster.h"

@interface Category()

//+(void)setManagedObjectContextToSelfContext;


@end

@implementation Category

@synthesize questions;

+(NSArray*)categories{
    
     // [self setManagedObjectContextToSelfContext];
    
    NSMutableArray *elements=[[NSMutableArray alloc]init];
    
 
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              
                                              entityForName:@"CategoryMaster"  inManagedObjectContext:[dataManager managedObjectContext]];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDescription];
    
    
    NSError *error = nil;
    
    // NSArray *arrayofData = [[dataManager managedObjectContext] executeFetchRequest:request error:&error];
    NSMutableArray *arrayofData = [[[dataManager managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
  
   
    
    NSLog(@"elements %@",elements);
    
        return arrayofData;

    
    
}

+(Category*)categoryByName:(NSString *)name{
    
    NSArray *categoriesByName;

    NSEntityDescription *entityDescription = [NSEntityDescription
                                              
                                              entityForName:@"CategoryMaster"  inManagedObjectContext:[dataManager managedObjectContext]];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:
                         @"(ANY categoryName CONTAINS[c] %@)",name]];
    [fetch setFetchLimit:1];
    
    NSError *error = nil;
    categoriesByName= [[dataManager managedObjectContext] executeFetchRequest:fetch error:&error];

   
 
    
   // NSLog(@"category name %@",categoriesByName);
    
  
    NSAssert([categoriesByName count] == 1, @"There should be only one category for the given name");
  
    return [categoriesByName objectAtIndex:0];
}

//+(void)setManagedObjectContextToSelfContext
//{
//    NSManagedObjectContext *managedObjectContext;
//    managedObjectContext = [dataManager managedObjectContext];
//    
//}
@end
