//
//  CollectionViewController.m
//  NavCtrl
//
//  Created by Bryan Fein on 7/13/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()


@end

@implementation CollectionViewController

-(void)GetRequest{
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://finance.yahoo.com/d/quotes.csv?s=AAPL,SSNLF,2498.TW,MSI&f=sl1&e=.csv"]];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        self.stockTicker = [[NSString alloc]initWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
        
        
        NSArray *stockPairs = [self.stockTicker componentsSeparatedByString:@"\n"];
        for (int i = 0; i <stockPairs.count-1; i++){
            NSString *singleStock = stockPairs[i];
            NSArray *stockAndPrice = [singleStock componentsSeparatedByString:@","];
            Company *stockCompany = self.companyList[i];
            stockCompany.stock = [stockAndPrice objectAtIndex:1];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
    }];
    
    [task resume];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.dao = [DAO sharedManager];
//  [self.dao companyAndProductInfo];
    [self.dao fetchObject];

    
    
    self.companyList = self.dao.companyList;
    
    //This is the title of the 1st page
    self.title = @"Mobile device makers";
    
    [self GetRequest];
    
    
    // Do any additional setup after loading the view from its nib.
    
    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake(200,200)];
    [flowLayout setScrollDirection: UICollectionViewScrollDirectionHorizontal];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentifier = @"cvCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Company *company = [self.companyList objectAtIndex:indexPath.row];

    
    cell.backgroundView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:[[self.companyList objectAtIndex:indexPath.row]logo]]];
    
    UILabel *titleLable = (UILabel *) [cell viewWithTag:100];
    [titleLable setText:[[self.companyList objectAtIndex:indexPath.row]stock]];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];

    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.companyList count];
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    Company *currentCompanies = [self.companyList objectAtIndex:[indexPath row]];
    
    self.ChildCVC = [[ChildCollectionViewController alloc] initWithNibName:@"ChildCollectionViewController" bundle:nil];

    self.ChildCVC.products = currentCompanies.products;
    self.ChildCVC.title =[[self.companyList objectAtIndex:[indexPath row]]name];

    [self.navigationController pushViewController:self.ChildCVC animated:YES];

    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
