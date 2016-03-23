//
//  Company.m
//  NavCtrl
//
//  Created by Aditya Narayan on 6/15/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "Company.h"


@implementation Company



-(instancetype)initWithName :(NSString*)name andImageName:(NSString*)logo andProducts:(NSMutableArray *)products{

    self = [super init];
    if (self){
        _name = name;
        _logo = logo;
        _products = products;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    //Encode properties, other class variables, etc
    NSLog(@"Encoder Called");
    [encoder encodeObject:[self name] forKey:@"name"];
    [encoder encodeObject:[self logo] forKey:@"logo"];
    [encoder encodeObject:[self products] forKey:@"products"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    NSLog(@"Decoder Called");
    self = [super init];
    if(self)
    {
        //decode properties, other class vars
        [self setName:[decoder decodeObjectForKey:@"name"]];
        [self setLogo:[decoder decodeObjectForKey:@"logo"]];
        [self setProducts:[decoder decodeObjectForKey:@"products"]];
    }
    return self;
}

@end
