//
//  ImageToDataTransfer.m
//  wordquiz
//
//  Created by John wesley moses on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageToDataTransfer.h"

@implementation ImageToDataTransfer

+ (Class)transformedValueClass 
{
    return [NSData class]; 
}

+ (BOOL)allowsReverseTransformation 
{
    return YES; 
}

- (id)transformedValue:(id)value 
{
    if (value == nil)
        return nil;
    
    // I pass in raw data when generating the image, save that directly to the database
    if ([value isKindOfClass:[NSData class]])
        return value;
    
    return UIImagePNGRepresentation((UIImage *)value);
}

- (id)reverseTransformedValue:(id)value
{
    return [UIImage imageWithData:(NSData *)value];
}


@end
