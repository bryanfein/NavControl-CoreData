//
//  CollectionViewController.h
//  NavCtrl
//
//  Created by Bryan Fein on 7/13/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"
#import "Products.h"
#import "ChildCollectionViewController.h"
#import "CoreDataStack.h"


@interface CollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) DAO *dao;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, strong) NSString *stockTicker;
@property (nonatomic, strong) ChildCollectionViewController *ChildCVC;
@property (nonatomic, strong) UIView*selectedBackgroundView;
//@property (nonatomic, strong) IBOutlet ChildCollectionViewController *childCVC;


-(void)GetRequest;

@end
