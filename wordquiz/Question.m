//
//  Question.m
//  wordquiz
//
//  Created by Administrator on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Question.h"
#import "dataManager.h"
#import "QuestionMaster.h"
#import "CategoryMaster.h"

@implementation Question

@synthesize managedObjectContext;

+(NSMutableArray*)arrayQuestions{
    
    
    NSMutableArray *elements=[[NSMutableArray alloc]init];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              
                                              entityForName:@"QuestionMaster"  inManagedObjectContext:[dataManager managedObjectContext]];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDescription];
    
    
    NSError *error = nil;
    
    NSMutableArray *arrayofData = [[[dataManager managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    
    NSLog(@"elements %@",elements);
    
    return arrayofData;
    
}

+(NSArray*)arrayQuestionsForCategoryName:(NSString *)name
{
    NSArray *questionForCategoryName;
    
    QuestionMaster *questionMaster;
    
    NSArray *relationsArray;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"CategoryMaster"  inManagedObjectContext:[dataManager managedObjectContext]];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    
    [fetch setEntity:entityDescription];
    
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"categoryName CONTAINS %@",name]];
    
    [fetch setFetchLimit:1];
    
    NSError *error = nil;
    
    questionForCategoryName =[[dataManager managedObjectContext] executeFetchRequest:fetch error:&error];
    
    NSLog(@"Question category name %@",questionForCategoryName);
    
    for(CategoryMaster *categoryName in questionForCategoryName)
    {
        NSLog(@"CategoryName %@",categoryName.categoryName);
        NSLog(@"CategoryRelation %@",categoryName.categoryQuestionRelationship);
        
        relationsArray = [categoryName.categoryQuestionRelationship allObjects];
        
        NSLog(@"Array %d", [relationsArray count]);
        
        for(questionMaster in relationsArray){
            
            NSLog(@"question Name %@", questionMaster.questionName);
        }
        
    }
    
    return relationsArray;
}
+(Question*)arrayQuestionsForQuestionTitleContains:(NSString *)title
{
    NSArray *questionForTitle;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              
                                              entityForName:@"QuestionMaster"  inManagedObjectContext:[dataManager managedObjectContext]];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:
                         @"(ANY questionName CONTAINS[c] %@)",title]];
    [fetch setFetchLimit:1];
    
    NSError *error = nil;
    questionForTitle= [[dataManager managedObjectContext] executeFetchRequest:fetch error:&error];
    
    return [questionForTitle objectAtIndex:0];
}
+(NSArray*)arrayQuestionsForCategoryRelationID:(NSNumber *)relationID
{
    NSArray *questionForCategoryID;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              
                                              entityForName:@"QuestionMaster"  inManagedObjectContext:[dataManager managedObjectContext]];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:
                         @"(ANY categoryRelationID contains[cd] %@)",relationID]];
    
    NSError *error = nil;
    questionForCategoryID= [[dataManager managedObjectContext] executeFetchRequest:fetch error:&error];
    
    return questionForCategoryID;
}


@end
