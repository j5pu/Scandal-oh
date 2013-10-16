//
//  BIZPhotoCollectionViewCell.m
//  Scandal oh
//
//  Created by Michel Barbou Salvador on 10/16/13.
//  Copyright (c) 2013 Michel Barbou Salvador. All rights reserved.
//

#import "BIZPhotoCollectionViewCell.h"

@implementation BIZPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle]loadNibNamed:@"photoCollectionViewCell"
                                                             owner:self
                                                           options:nil];
        
        if ([arrayOfViews count]<1) {
            
            return nil;
        }
        if (![[arrayOfViews objectAtIndex:0]isKindOfClass:[UICollectionViewCell class]]) {
            
            return nil;
        }
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
