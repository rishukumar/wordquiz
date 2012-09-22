//
//  Answer.m
//  wordquiz
//
//  Created by John wesley moses on 02/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Answer.h"
#import "dataManager.h"

@implementation Answer

+(NSArray*)arrayAnswerForQuestionRelationID:(NSNumber *)relationID
{
    NSArray *answerForQuestionID;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              
                                              entityForName:@"QuestionDetails"  inManagedObjectContext:[dataManager managedObjectContext]];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:
                         @"(ANY questionRelationID == %@)",relationID]];
    
    NSError *error = nil;
    answerForQuestionID= [[dataManager managedObjectContext] executeFetchRequest:fetch error:&error];
    
    return answerForQuestionID;
}
+(NSArray*)groupNameForGroupRelationID:(NSNumber *)relationID
{
    NSArray *groupName;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              
                                              entityForName:@"QuestionGroup"  inManagedObjectContext:[dataManager managedObjectContext]];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:
                         @"(ANY groupID == %@)",relationID]];
    
    NSError *error = nil;
    groupName= [[dataManager managedObjectContext] executeFetchRequest:fetch error:&error];
      return groupName;
}
+(NSArray*)groupIdForGroupRelationName:(NSString *)relationName
{
    NSArray *groupId;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              
                                              entityForName:@"QuestionGroup"  inManagedObjectContext:[dataManager managedObjectContext]];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:
                         @"(ANY groupName == %@)",relationName]];
    
    NSError *error = nil;
    groupId= [[dataManager managedObjectContext] executeFetchRequest:fetch error:&error];
    return groupId;
}
@end
