//
//  BIZHomeViewController.h
//  Scandal oh
//
//  Created by Michel Barbou Salvador on 10/16/13.
//  Copyright (c) 2013 Michel Barbou Salvador. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIZHomeViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)goToCameraOptions:(id)sender;

@end
