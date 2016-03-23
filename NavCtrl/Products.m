//
//  Products.m
//  NavCtrl
//
//  Created by Aditya Narayan on 6/15/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "Products.h"


@implementation Products

-(instancetype)initWithName :(NSString*)productName andImageName:(NSString*)productLogo andURL: (NSString*)productUrl{
    self = [super init];
    if (self){
        _productName = productName;
        _productLogo = productLogo;
        _productUrl = productUrl;
    }
    return self;

}


- (void)encodeWithCoder:(NSCoder *)encoder{
    //Encode properties, other class variables, etc
    NSLog(@"Encoder Called");
    [encoder encodeObject:[self productName] forKey:@"productName"];
    [encoder encodeObject:[self productLogo] forKey:@"productLogo"];
    [encoder encodeObject:[self productUrl] forKey:@"productUrl"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    NSLog(@"Decoder Called");
    self = [super init];
    if(self)
    {
        //decode properties, other class vars
        [self setProductName:[decoder decodeObjectForKey:@"productName"]];
        [self setProductLogo:[decoder decodeObjectForKey:@"productLogo"]];
        [self setProductUrl:[decoder decodeObjectForKey:@"productUrl"]];
    }
    return self;
}



@end
