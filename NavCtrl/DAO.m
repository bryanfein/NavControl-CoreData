//
//  DAO.m
//  NavCtrl
//
//  Created by Aditya Narayan on 6/22/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "DAO.h"

@implementation DAO


//DAO Singelton
+ (instancetype) sharedManager
{
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^
                  {
                      sharedManager = [[self alloc]init];
                  });
    
    return sharedManager;
}


-(void)companyInfo
{
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    
    
    NSEntityDescription *managedCompany = [NSEntityDescription entityForName:@"ManagedCompany" inManagedObjectContext:coreDataStack.managedObjectContext];
    
    
    //create managed objects
    
    ManagedCompany *apple = [[ManagedCompany alloc] initWithEntity:managedCompany insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    ManagedCompany *samsung = [[ManagedCompany alloc] initWithEntity:managedCompany insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    ManagedCompany *htc = [[ManagedCompany alloc] initWithEntity:managedCompany insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    ManagedCompany *motorola = [[ManagedCompany alloc] initWithEntity:managedCompany insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    ///use the managedCompany entity
    
    apple.companyID = @"1";
    apple.name = @"apple";
    apple.logo = @"Apple_logo.png";
    
    samsung.companyID = @"2";
    samsung.name = @"samsung";
    samsung.logo = @"Samsung_Logo.png";
    
    htc.companyID = @"3";
    htc.name = @"htc";
    htc.logo = @"htc logo 2.png";
    
    motorola.companyID = @"4";
    motorola.name = @"motorola";
    motorola.logo = @"Motorola_Logo.png";
    
    NSMutableArray *tempCompanies = [[NSMutableArray alloc]initWithObjects:apple, samsung, htc, motorola, nil];
    
    for (ManagedCompany *mC in tempCompanies)
        
    {
        Company *newCompany = [Company new];
        
        (newCompany.companyID = mC.companyID);
        (newCompany.name = mC.name);
        (newCompany.logo = mC.logo);
        (newCompany.products = [[NSMutableArray alloc]init]);
        
        [self.companyList addObject:newCompany];
        
        [coreDataStack saveContext];
        
    }
}

-(void)productInfo {
    
    //products
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    
    NSEntityDescription *managedProduct = [NSEntityDescription entityForName:@"ManagedProducts" inManagedObjectContext:coreDataStack.managedObjectContext];
    
    
    ManagedProducts *iPad = [[ManagedProducts alloc] initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    iPad.companyID = @"1";
    iPad.productName = @"iPad";
    iPad.productLogo = @"Apple_logo.png";
    iPad.productURL = @"https://www.apple.com/ipad/";
    
    
    
    ManagedProducts *iPodTouch = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    iPodTouch.companyID = @"1";
    iPodTouch.productName = @"iPodTouch";
    iPodTouch.productLogo = @"Apple_logo.png";
    iPodTouch.productURL = @"https://www.apple.com/ipod-touch/";
    
    ManagedProducts *iPhone = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    iPhone.companyID = @"1";
    iPhone.productName = @"iPhone";
    iPhone.productLogo = @"Apple_logo.png";
    iPhone.productURL = @"https://www.apple.com/iphone/";
    
    
    ManagedProducts *galaxyS4 = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    galaxyS4.companyID = @"2";
    galaxyS4.productName = @"galaxyS4";
    galaxyS4.productLogo = @"Samsung_Logo.png";
    galaxyS4.productURL = @"http://www.samsung.com/global/microsite/galaxys4/";
    
    
    ManagedProducts *galaxyNote = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    
    galaxyNote.companyID = @"2";
    galaxyNote.productName = @"galaxyNote";
    galaxyNote.productLogo = @"Samsung_Logo.png";
    galaxyNote.productURL = @"http://www.samsung.com/global/microsite/galaxynote/note/index.html?type=find";
    
    
    ManagedProducts *galaxyTab = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    
    galaxyTab.companyID = @"2";
    galaxyTab.productName = @"galaxyTab";
    galaxyTab.productLogo = @"Samsung_Logo.png";
    galaxyTab.productURL = @"http://www.samsung.com/us/topic/introducing-the-galaxy-tab-s/index.html?cid=ppc-&gclid=CjwKEAjwwN-rBRD-oMzT6aO_wGwSJABwEIkJWlLOBwKEElGzACzIkJmJhUTy_kr1Q8dHFGlMFcIE7xoCG1_w_wcB";
    
    
    ManagedProducts *oneM9 = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    
    oneM9.companyID = @"3";
    oneM9.productName = @"oneM9";
    oneM9.productLogo = @"htc logo 2.png";
    oneM9.productURL = @"http://www.htc.com/us/smartphones/htc-one-m9/";
    
    
    ManagedProducts *oneM8 = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    oneM8.companyID = @"3";
    oneM8.productName = @"oneM8";
    oneM8.productLogo = @"htc logo 2.png";
    oneM8.productURL = @"http://www.htc.com/us/smartphones/htc-one-m8/";
    
    
    ManagedProducts *oneE8 = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    
    oneE8.companyID = @"3";
    oneE8.productName = @"oneE8";
    oneE8.productLogo = @"htc logo 2.png";
    oneE8.productURL = @"http://www.htc.com/us/smartphones/htc-one-e8/";
    
    
    ManagedProducts *motoG = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    
    motoG.companyID = @"4";
    motoG.productName = @"motoG";
    motoG.productLogo = @"Motorola_Logo.png";
    motoG.productURL = @"http://www.motorola.com/us/smartphones/moto-g-2nd-gen/moto-g-2nd-gen.html";
    
    
    
    ManagedProducts *motoX = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    motoX.companyID = @"4";
    motoX.productName = @"motoX";
    motoX.productLogo = @"Motorola_Logo.png";
    motoX.productURL = @"http://www.motorola.com/us/Moto-X/FLEXR1.html";
    
    
    
    ManagedProducts *driodMaxx = [[ManagedProducts alloc]initWithEntity:managedProduct insertIntoManagedObjectContext:coreDataStack.managedObjectContext];
    
    driodMaxx.companyID = @"4";
    driodMaxx.productName = @"driodMaxx";
    driodMaxx.productLogo = @"Motorola_Logo.png";
    driodMaxx.productURL = @"https://www.motorola.com/us/smartphones/droid-maxx/m-droid-maxx.html";
    
    
    //    [self fetchObject];
    //    [self fetchProducts];
    
    //delete then saveContext
    [coreDataStack saveContext];
    
}
/*
 
 (•_•)
 ∫\ \___( •_•)
 _∫∫_∫∫ɯ \ \
 
 */


-(void) fetchObject {
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    
    self.companyList = [[NSMutableArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription * entity = [[coreDataStack.managedObjectModel entitiesByName] objectForKey:@"ManagedCompany"];
    
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (result.count == 0) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        //create instances of objects
        [self companyInfo];
        return;
        
    } else {
        
        for (ManagedCompany *mC in result)
            
        {
            Company *newCompany = [Company new];
            
            (newCompany.companyID = mC.companyID);
            (newCompany.name = mC.name);
            (newCompany.logo = mC.logo);
            (newCompany.products = [[NSMutableArray alloc]init]);
            
            [self.companyList addObject:newCompany];
            
        }
        
        
    }
    [self fetchProducts];
}
-(void) fetchProducts {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription * entity = [[coreDataStack.managedObjectModel entitiesByName] objectForKey:@"ManagedProducts"];
    
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (result.count == 0) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        [self productInfo];
    }
    else
    {
        
        for (Company *aCompany in self.companyList){
            for (ManagedProducts *mP in result)
            {
                Products *newProducts = [Products new];
                
                (newProducts.companyID = mP.companyID);
                (newProducts.productName = mP.productName);
                (newProducts.productUrl = mP.productURL);
                (newProducts.productLogo= mP.productLogo);
                [self.ProductArray addObject:newProducts];
                
                if ([aCompany.companyID isEqualToString:newProducts.companyID]) {
                    [aCompany.products addObject:newProducts];
                }
            }
        }
    }
}


-(void) deleteFunction: (NSString *)productName {
    
    NSError *error = nil;
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [[coreDataStack.managedObjectModel entitiesByName] objectForKey:@"ManagedProducts"];
    [fetchRequest setEntity:entity];
    
    NSArray *result = [coreDataStack.managedObjectContext executeFetchRequest: fetchRequest error:&error];
    
    
    for (ManagedProducts *p in result) {
        if ([productName isEqualToString:p.productName]) {
            [coreDataStack.managedObjectContext deleteObject:p];
        }
    }
    
    [coreDataStack saveContext];
}



@end
