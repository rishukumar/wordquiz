//
//  XMLReader.m
//  wordquiz
//
//  Created by John wesley moses on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLReader.h"
#import "dataManager.h"
#import "QuestionMaster.h"
#import "ConstantHeader.h"

@interface XMLReader()
{
    TBXML *tbxml;
    NSString *filePath;
    NSMutableArray *master;
    NSManagedObject *newDocumentForQuestion;
    NSManagedObject *newDocumentForAnswer;
    NSManagedObject *newDocumentForCategories;
    NSManagedObject *newDocumentForGroups;
    NSManagedObject *newDocumentForCorrect;

    NSManagedObjectContext * context;
    
    NSMutableDictionary *question;
    NSMutableDictionary *answers;
    NSMutableDictionary *groups;
    NSMutableDictionary *correct;
    NSMutableDictionary *categories;
}
@property(nonatomic,strong)NSString *some1XML;
@property(nonatomic,strong)NSString *someXML;
- (NSData *)downloadXMLFile;
- (NSString *)getFilePath;
- (NSData *)localXMLFile;
-(NSString *)localPathForImage;
@end

@implementation XMLReader
@synthesize records,some1XML,someXML;
//NSString * const URLPATH = @"http://www.quitzer.com/media/images/uploads/";


- (void)loadRecords
{
    someXML = @"http://quitzer.com/quizeeEditer.xml";
    
        //some1XML=@"http://172.17.0.122/quitzer/quizeeEdited.xml";
master = [[NSMutableArray alloc]init];
    
    //  NSArray *masterArray=[[NSArray alloc]init];
    question = [[NSMutableDictionary alloc]init];
    categories=[[NSMutableDictionary alloc]init];
    groups=[[NSMutableDictionary alloc]init];
    answers=[[NSMutableDictionary alloc]init];
    correct=[[NSMutableDictionary alloc]init];
    
    
    if([[NSFileManager defaultManager] fileExistsAtPath:[self getFilePath]])
    {
        tbxml = [TBXML tbxmlWithXMLData:[self localXMLFile]]; 
    }
    else
    {
        tbxml = [TBXML tbxmlWithXMLData:[self downloadXMLFile]];
    }
    
    
    records = [NSMutableArray array];
    
       if (tbxml.rootXMLElement)
       [self traverseElement:tbxml.rootXMLElement];
   
 
}
- (void ) traverseElement:(TBXMLElement *)element 
{

context = [dataManager managedObjectContext];
  
     
do{
        

    if([[TBXML elementName:element] isEqualToString:@"table"])
    {
            NSLog(@"%@",[TBXML elementName:element]);
            
            TBXMLAttribute * attribute = element->firstAttribute;
            if([[TBXML attributeValue:attribute]isEqualToString:@"basicgames"])
            {
                NSLog(@"  question Master %@",[TBXML elementName:element->firstChild]);
               
                newDocumentForQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"QuestionMaster" inManagedObjectContext:context];

                TBXMLElement *columnElementForBasicGames=[TBXML childElementNamed:@"column" parentElement:element];
                do{
                    TBXMLAttribute * columnAttribute = columnElementForBasicGames->firstAttribute;
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"instructions"])
                    {
                        NSLog(@"instructions %@",[TBXML textForElement:columnElementForBasicGames]);
                        [question setObject:[TBXML textForElement:columnElementForBasicGames] forKey:@"questionDescription"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"name"])
                    {
                        NSLog(@"name %@",[TBXML textForElement:columnElementForBasicGames]);
                        [question setObject:[TBXML textForElement:columnElementForBasicGames] forKey:@"questionName"];
                    
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"time"])
                    {
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        NSNumber * myNumberForTime = [formatter numberFromString:[TBXML textForElement:columnElementForBasicGames]];
                                      
                        [question setObject:myNumberForTime forKey:@"time"];
                        NSLog(@"time %@",[TBXML textForElement:columnElementForBasicGames]);
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"id"])
                    {
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        NSNumber * myNumberForID = [formatter numberFromString:[TBXML textForElement:columnElementForBasicGames]];
                        
                        [question setObject:myNumberForID forKey:@"questionID"];
                        NSLog(@"questionID %@",[TBXML textForElement:columnElementForBasicGames]);
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"category"])
                    {
                        //NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                       // [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        //[formatter setDecimalSeparator:@","];
                       // NSNumber * myNumberForCategory = [formatter numberFromString:[TBXML textForElement:columnElementForBasicGames]];
                        
                        [question setObject:[TBXML textForElement:columnElementForBasicGames] forKey:@"categoryRelationID"];
                        NSLog(@"categoryRelationID %@",[TBXML textForElement:columnElementForBasicGames]);
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"thumb"])
                    {
                        NSLog(@"thumb %@",[TBXML textForElement:columnElementForBasicGames]);
                        NSString *path=[URLPATH stringByAppendingFormat:[TBXML textForElement:columnElementForBasicGames]];
                        NSURL *url=[NSURL URLWithString:path];
                        UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
                        
                        NSString *imageFilePath = [NSString stringWithFormat:@"%@/%@",[self localPathForImage],[TBXML textForElement:columnElementForBasicGames]];
                        NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(image)];
                  
                        [data1 writeToFile:imageFilePath atomically:YES];
                    
                        [question setObject:imageFilePath forKey:@"questionThumb"];
                        
                    }


                }while((columnElementForBasicGames=columnElementForBasicGames->nextSibling));
                
            }
            if([[TBXML attributeValue:attribute]isEqualToString:@"categories"])
            {
                NSLog(@"  category Master %@",[TBXML elementName:element->firstChild]);
            
                newDocumentForCategories=[NSEntityDescription insertNewObjectForEntityForName:@"CategoryMaster" inManagedObjectContext:context];
            
            
        
                TBXMLElement *columnElementForCategories=[TBXML childElementNamed:@"column" parentElement:element];
                do{
                    TBXMLAttribute * columnAttribute = columnElementForCategories->firstAttribute;
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"name"])
                    {
                        NSLog(@"name %@",[TBXML textForElement:columnElementForCategories]);
                        [categories setObject:[TBXML textForElement:columnElementForCategories] forKey:@"categoryName"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"id"])
                    {
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        NSNumber * myNumberForCategoryID = [formatter numberFromString:[TBXML textForElement:columnElementForCategories]];
                        
                        [categories setObject:myNumberForCategoryID forKey:@"categoryID"];
                        NSLog(@"categoryID %@",[TBXML textForElement:columnElementForCategories]);
                      //  NSLog(@"id %@",[TBXML textForElement:columnElementForCategories]);
                       // [categories setObject:[TBXML textForElement:columnElementForCategories] forKey:@"categoryID"];
                    }
            
                }while((columnElementForCategories=columnElementForCategories->nextSibling));
            }
            if([[TBXML attributeValue:attribute]isEqualToString:@"groups"])
            {
                NSLog(@"  Question group %@",[TBXML elementName:element->firstChild]);
            
                newDocumentForGroups=[NSEntityDescription insertNewObjectForEntityForName:@"QuestionGroup" inManagedObjectContext:context];
            
            
            
                TBXMLElement *columnElementForGroups=[TBXML childElementNamed:@"column" parentElement:element];
                do{
                    TBXMLAttribute * columnAttribute = columnElementForGroups->firstAttribute;
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"name"])
                    {
                        NSLog(@"name %@",[TBXML textForElement:columnElementForGroups]);
                      //  NSString *strValue=[[TBXML textForElement:columnElementForGroups] stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
                        NSString * encodedString = [[TBXML textForElement:columnElementForGroups]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                        [groups setObject:encodedString forKey:@"groupName"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"id"])
                    {
                       // NSString *str=[NSString stringWithString:[TBXML textForElement:columnElementForGroups] encoding:NSUTF8StringEncoding];
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                       // NSString *str=[[TBXML textForElement:columnElementForGroups] stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
                        
                        NSNumber * myNumberForCategoryID = [formatter numberFromString:[TBXML textForElement:columnElementForGroups]];
                        
                        [groups setObject:myNumberForCategoryID forKey:@"groupID"];
                        NSLog(@"groupID %@",[TBXML textForElement:columnElementForGroups]);

                       // NSLog(@"id %@",[TBXML textForElement:columnElementForGroups]);
                      //  [groups setObject:[TBXML textForElement:columnElementForGroups] forKey:@"groupID"];
                    }
                
                }while((columnElementForGroups=columnElementForGroups->nextSibling));
            }
            if([[TBXML attributeValue:attribute]isEqualToString:@"words"])
            {
                NSLog(@"  Question Answers %@",[TBXML elementName:element->firstChild]);
            
                newDocumentForAnswer=[NSEntityDescription insertNewObjectForEntityForName:@"QuestionDetails" inManagedObjectContext:context];
            
            
            
                TBXMLElement *columnElementForAnswers=[TBXML childElementNamed:@"column" parentElement:element];
                do{
                    TBXMLAttribute * columnAttribute = columnElementForAnswers->firstAttribute;
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"word"])
                    {
                        NSLog(@"word %@",[TBXML textForElement:columnElementForAnswers]);
                        [answers setObject:[TBXML textForElement:columnElementForAnswers] forKey:@"answer"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"hint"])
                    {
                        NSLog(@"Reference %@",[TBXML textForElement:columnElementForAnswers]);
                        [answers setObject:[TBXML textForElement:columnElementForAnswers] forKey:@"hint"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"synonyms"])
                    {
                        NSLog(@"ALternate %@",[TBXML textForElement:columnElementForAnswers]);
                        [answers setObject:[TBXML textForElement:columnElementForAnswers] forKey:@"synonyms"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"puzzle"])
                    {
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        NSNumber * myNumberForCategoryID = [formatter numberFromString:[TBXML textForElement:columnElementForAnswers]];
                        
                        [answers setObject:myNumberForCategoryID forKey:@"questionRelationID"];
                        NSLog(@"questionRelationID %@",[TBXML textForElement:columnElementForAnswers]);
                       // NSLog(@"questionRelationID %@",[TBXML textForElement:columnElementForAnswers]);
                      //  [answers setObject:[TBXML textForElement:columnElementForAnswers] forKey:@"questionRelationID"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"group"])
                    {
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        NSNumber * myNumberForCategoryID = [formatter numberFromString:[TBXML textForElement:columnElementForAnswers]];
                        
                        [answers setObject:myNumberForCategoryID forKey:@"groupRelationID"];
                        NSLog(@"groupRelationID %@",[TBXML textForElement:columnElementForAnswers]);
                       // NSLog(@"qroupRelationID %@",[TBXML textForElement:columnElementForAnswers]);
                       // [answers setObject:[TBXML textForElement:columnElementForAnswers] forKey:@"qroupRelationID"];
                    }
                
                }while((columnElementForAnswers=columnElementForAnswers->nextSibling));
            }
            if([[TBXML attributeValue:attribute]isEqualToString:@"correct"])
            {
                NSLog(@"  Question Answers %@",[TBXML elementName:element->firstChild]);
            
                newDocumentForCorrect=[NSEntityDescription insertNewObjectForEntityForName:@"Score" inManagedObjectContext:context];
            
            
            
                TBXMLElement *columnElementForCorrect=[TBXML childElementNamed:@"column" parentElement:element];
                do{
                    TBXMLAttribute * columnAttribute = columnElementForCorrect->firstAttribute;
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"puzzle"])
                    {
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        NSNumber * myNumberForCategoryID = [formatter numberFromString:[TBXML textForElement:columnElementForCorrect]];
                        
                        [correct setObject:myNumberForCategoryID forKey:@"questionRelationID"];
                        NSLog(@"questionRelationID %@",[TBXML textForElement:columnElementForCorrect]);
                       // NSLog(@"questionRelationID %@",[TBXML textForElement:columnElementForCorrect]);
                      //  [correct setObject:[TBXML textForElement:columnElementForCorrect] forKey:@"questionRelationID"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"number"])
                    {
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        NSNumber * myNumberForCategoryID = [formatter numberFromString:[TBXML textForElement:columnElementForCorrect]];
                        
                        [correct setObject:myNumberForCategoryID forKey:@"correct"];
                        NSLog(@"correct %@",[TBXML textForElement:columnElementForCorrect]);
                       // NSLog(@"correct %@",[TBXML textForElement:columnElementForCorrect]);
                       // [correct setObject:[TBXML textForElement:columnElementForCorrect] forKey:@"correct"];
                    }
                    if([[TBXML attributeValue:columnAttribute]isEqualToString:@"count"])
                    {
                        NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
                        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                        NSNumber * myNumberForCategoryID = [formatter numberFromString:[TBXML textForElement:columnElementForCorrect]];
                        
                        [correct setObject:myNumberForCategoryID forKey:@"totalCount"];
                        NSLog(@"totalCount %@",[TBXML textForElement:columnElementForCorrect]);
                       // NSLog(@"totalCount %@",[TBXML textForElement:columnElementForCorrect]);
                       // [correct setObject:[TBXML textForElement:columnElementForCorrect] forKey:@"totalCount"];
                    }
                }while((columnElementForCorrect=columnElementForCorrect->nextSibling));
            }

    }                      
        
        if(element->firstChild)
            [self traverseElement:element->firstChild];   
        

        
}while ((element = element->nextSibling));  
[newDocumentForQuestion setValue:[question objectForKey:@"questionName"] forKey:@"questionName"];
[newDocumentForQuestion setValue:[question objectForKey:@"questionDescription"] forKey:@"questionDescription"];
[newDocumentForQuestion setValue:[question objectForKey:@"time"] forKey:@"timeLimit"];
[newDocumentForQuestion setValue:[question objectForKey:@"questionID"] forKey:@"questionID"];
[newDocumentForQuestion setValue:[question objectForKey:@"categoryRelationID"] forKey:@"categoryRelationID"];
[newDocumentForQuestion setValue:[question objectForKey:@"questionThumb"] forKey:@"questionThumb"];

    
[newDocumentForCategories setValue:[categories objectForKey:@"categoryName"] forKey:@"categoryName"];
[newDocumentForCategories setValue:[categories objectForKey:@"categoryID"] forKey:@"categoryID"];
    
    
[newDocumentForGroups setValue:[groups objectForKey:@"groupName"] forKey:@"groupName"];
[newDocumentForGroups setValue:[groups objectForKey:@"groupID"] forKey:@"groupID"];
    
[newDocumentForAnswer setValue:[answers objectForKey:@"answer"] forKey:@"answer"];
[newDocumentForAnswer setValue:[answers objectForKey:@"hint"] forKey:@"referenceText"];
[newDocumentForAnswer setValue:[answers objectForKey:@"synonyms"] forKey:@"alternateAnswer"];
[newDocumentForAnswer setValue:[answers objectForKey:@"questionRelationID"] forKey:@"questionRelationID"];
[newDocumentForAnswer setValue:[answers objectForKey:@"groupRelationID"] forKey:@"groupRelationID"];

    
[newDocumentForCorrect setValue:[correct objectForKey:@"questionRelationID"] forKey:@"questionRelationID"];
[newDocumentForCorrect setValue:[correct objectForKey:@"correct"] forKey:@"correct"];
[newDocumentForCorrect setValue:[correct objectForKey:@"totalCount"] forKey:@"totalCount"];

                           
NSError *error = nil;
[context save:&error];

    
}  



- (NSData *)downloadXMLFile
{
   
    NSURL *url = [NSURL URLWithString:self.someXML];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    [urlData writeToFile:[self getFilePath] atomically:YES];
    return urlData;
    
}
- (NSString *)getFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    filePath = [NSString stringWithFormat:@"%@/%@", [paths objectAtIndex:0],@"theXML.xml"];   
    return filePath;
}
- (NSData *)localXMLFile
{
    NSData *data=[NSData dataWithContentsOfFile:[self getFilePath]];
    return data;
}

-(NSString *)localPathForImage
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"ImageTable"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil]; 
    
    return dataPath;
}
    
//    
//    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    
//	// If you go to the folder below, you will find those pictures
//	NSLog(@"%@",docDir);
//    
//	NSLog(@"saving png");
//	NSString *pngFilePath = [NSString stringWithFormat:@"%@/test.png",docDir];
//	NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(image)];
//	[data1 writeToFile:pngFilePath atomically:YES];
//}

@end
