//
//  ChildCollectionViewController.m
//  NavCtrl
//
//  Created by Bryan Fein on 7/13/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "ChildCollectionViewController.h"

@interface ChildCollectionViewController ()

@end

@implementation ChildCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.ChildCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake(200,200)];
    [flowLayout setScrollDirection: UICollectionViewScrollDirectionHorizontal];
    
    [self.ChildCollectionView setCollectionViewLayout:flowLayout];
    
    
    // attach long press gesture to collectionView
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = .3; //seconds
    longPress.delegate = self;
    [self.ChildCollectionView addGestureRecognizer:longPress];
}


-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    
     self.tapLocation = [gestureRecognizer locationInView:self.ChildCollectionView];
    NSIndexPath *indexPath = [self.ChildCollectionView indexPathForItemAtPoint:self.tapLocation];
    if (indexPath && gestureRecognizer.state == UIGestureRecognizerStateBegan) {
      self.itemToBeDeleted = [self.products objectAtIndex :[indexPath row]];
        UIAlertView *deleteAlert = [[UIAlertView alloc]
                                    initWithTitle:@"Delete?"
                                    message:@"Are you sure you want to delete this product?"
                                    delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
        [deleteAlert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSIndexPath *indexPath = [self.ChildCollectionView indexPathForItemAtPoint:self.tapLocation];
//need to delete the cell that has been selected from the product array or the collection view
    if (buttonIndex == 1) {
        
        // Do what you need to do to delete the cell
        Products *productToDelete = [self.products objectAtIndex:indexPath.row];
        [self.products removeObject:productToDelete];

        DAO *dao = [DAO sharedManager];
        [dao deleteFunction:productToDelete.productName];
    }
    [self.ChildCollectionView reloadData];

}



-(void)viewWillAppear:(BOOL)animated {
    
    [self.ChildCollectionView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cvCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel *titleLable = (UILabel *) [cell viewWithTag:100];
    [titleLable setText:[[self.products objectAtIndex:indexPath.row]productName]];
    
    cell.backgroundView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:[[self.products objectAtIndex:indexPath.row]productLogo]]];
    

    return cell;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.products count];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.webView = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];

//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    
    self.webView.title = [[self.products objectAtIndex:indexPath.row]productName];
    
    Products *product = [[Products alloc]init];
    
    //add the products to the products array --  all should be in one array.
    product = [self.products objectAtIndex:[indexPath row]];
    
    
    self.webView.URL = product.productUrl;
    
    
    // Push the view controller.
    [self.navigationController pushViewController: self.webView animated:YES];
}





//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (buttonIndex == 1) {
//        // Do what you need to do to delete the cell
//        [self.ChildCollectionView reloadData];
//    }
//}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
