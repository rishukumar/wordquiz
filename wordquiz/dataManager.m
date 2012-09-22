//
//  dataManager.m
//  wordQuizLibrary
//
//  Created by Administrator on 05/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dataManager.h"
@interface dataManager()

+(NSManagedObjectModel *)managedObjectModel;
+(NSPersistentStoreCoordinator *)persistentStoreCoordinator;
+(NSString*)applicationDocumentsDirectory;


@end
@implementation dataManager

+(NSString*)applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}


+(NSManagedObjectContext *)managedObjectContext
{
    static NSManagedObjectContext *managedObjectContext;
    if(managedObjectContext!=nil){
        return managedObjectContext;
    }
    @try {
        NSPersistentStoreCoordinator *coordinator = [[self class] persistentStoreCoordinator];
        if (coordinator != nil) {
            managedObjectContext = [[NSManagedObjectContext alloc] init];
            [managedObjectContext setPersistentStoreCoordinator: coordinator];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception occur %@",exception);
    }
        return managedObjectContext;

}

+(NSManagedObjectModel *)managedObjectModel
{
    static NSManagedObjectModel *managedObjectModel;
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
         NSBundle *modelWrapper = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"wordQuiz" ofType:@"momd"]];
        NSString *modelPath = [modelWrapper pathForResource:@"wordQuiz" ofType:@"mom"];
        NSLog(@"%@",modelPath);
        managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:[NSURL fileURLWithPath:modelPath]];

        //NSLog(@"object model %@",managedObjectModel);
    return managedObjectModel;
}

+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    static NSPersistentStoreCoordinator *persistentStoreCoordinator;
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }

    NSError *error=nil;
	NSString *storePath = [[[self class] applicationDocumentsDirectory] stringByAppendingPathComponent: @"wordQuiz.sqlite"];
    
    NSLog(@"Store path %@",storePath);
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:storePath]) {
		NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:@"wordQuiz" ofType:@"sqlite"];
        NSLog(@"Default Path %@",defaultStorePath);
		if (defaultStorePath) {
            //[fileManager removeItemAtURL:[NSURL fileURLWithPath:defaultStorePath]  error:NULL];
     //   [fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
           

		}
        NSLog(@"Default Path %@",defaultStorePath);
        NSLog(@"Store path %@",storePath);
	}
//	NSURL *storeUrl = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DataModel.sqlite"];
NSURL *storeUrl =[NSURL fileURLWithPath:storePath];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[[self class] managedObjectModel]];
    
   //  NSError *error = nil;
   NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
 
	if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error])
    {
        NSLog(@"store url %@",storeUrl);
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1);
    }    
    
    return persistentStoreCoordinator;
}

@end
