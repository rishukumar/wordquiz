//
//  XMLReader.h
//  wordquiz
//
//  Created by John wesley moses on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"


@interface XMLReader : NSObject

//extern NSString * const URLPATH;

@property(nonatomic,strong)NSMutableArray *records;

-(void)loadRecords;
- (void) traverseElement:(TBXMLElement *)element ;
@end
