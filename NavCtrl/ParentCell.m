//
//  ParentCell.m
//  NavCtrl
//
//  Created by Bryan Fein on 7/9/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "ParentCell.h"

@implementation ParentCell

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView = [[UIImageView alloc]init];
        self.name = [[UILabel alloc]init];
        
        [self.contentView addSubview:self.imageView];
    }

    return self;
}



-(void) layoutSubviews {
    [super layoutSubviews];
    //this makes the image fill the cell
    self.imageView.frame = self.contentView.bounds;
    
    
}
@end
