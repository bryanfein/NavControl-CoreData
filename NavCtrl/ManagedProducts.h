//
//  ManagedProducts.h
//  NavCtrl
//
//  Created by Bryan Fein on 7/23/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ManagedProducts : NSManagedObject

@property (nonatomic, retain) NSString * companyID;
@property (nonatomic, retain) NSString * productURL;
@property (nonatomic, retain) NSString * productName;
@property (nonatomic, retain) NSString * productLogo;

@end
