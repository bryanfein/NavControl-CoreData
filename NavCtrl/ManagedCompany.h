//
//  ManagedCompany.h
//  NavCtrl
//
//  Created by Bryan Fein on 7/23/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ManagedCompany : NSManagedObject

@property (nonatomic, retain) NSString * companyID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * logo;
@property (nonatomic, retain) NSString * stock;

@end
