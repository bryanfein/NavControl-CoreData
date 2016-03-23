//
//  DAO.h
//  NavCtrl
//
//  Created by Aditya Narayan on 6/22/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Products.h"
#import <CoreData/CoreData.h>
#import "CoreDataStack.h"
#import "ManagedCompany.h"
#import "ManagedProducts.h"

@interface DAO : NSObject



@property (nonatomic, strong) NSMutableArray *companyList;

@property(nonatomic,strong) NSMutableArray *ListOfCompanies;
@property(nonatomic,strong) NSMutableArray *arrayOfProductArrays;
@property(nonatomic,strong) NSMutableArray *apple_products;
@property(nonatomic,strong) NSMutableArray *samsung_products;
@property(nonatomic,strong) NSMutableArray *htc_products;
@property(nonatomic,strong) NSMutableArray *motorola_products;
@property(nonatomic,strong) NSMutableArray *ProductArray;
//@property (nonatomic, strong) NSMutableArray *managedCompanyArray;

//-(void)companyAndProductInfo;

+ (id)sharedManager;
-(void) deleteFunction: (NSString *)productName;
-(void) fetchObject;
-(void) fetchProducts;
-(void)productInfo;

//-(void) saveData;
//-(void) readData; 
@end
