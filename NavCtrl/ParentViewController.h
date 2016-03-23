//
//  ParentViewController.h
//  NavCtrl
//
//  Created by Bryan Fein on 7/10/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildViewCollectionViewController.h"
#import "DAO.h"

@class ChildViewCollectionViewController;

@interface ParentViewController : UICollectionViewController



@property (nonatomic, retain) ChildViewCollectionViewController * childVC2;
@property (nonatomic, strong) DAO *DAO;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, strong) NSString *stockTicker;


-(void)GetRequest;


@end
