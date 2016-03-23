//
//  ChildCollectionViewController.h
//  NavCtrl
//
//  Created by Bryan Fein on 7/13/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"
#import "Products.h"
#import "WebViewController.h"

@interface ChildCollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic) CGPoint tapLocation;
@property (nonatomic, strong) NSString *itemToBeDeleted;
@property (nonatomic, strong) IBOutlet UICollectionView *ChildCollectionView;
@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, strong) WebViewController *webView;
@property (nonatomic, strong) NSString *URL;
@property (nonatomic, strong) NSMutableArray *productsLogo;


@property(nonatomic, strong) UILongPressGestureRecognizer *pressLong;
@end
