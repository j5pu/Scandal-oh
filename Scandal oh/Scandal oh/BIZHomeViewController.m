//
//  BIZHomeViewController.m
//  Scandal oh
//
//  Created by Michel Barbou Salvador on 10/16/13.
//  Copyright (c) 2013 Michel Barbou Salvador. All rights reserved.
//

#import "BIZHomeViewController.h"
#import "BIZPhotoCollectionViewCell.h"

@interface BIZHomeViewController ()

@property (nonatomic,strong)UIImagePickerController *picker;

@end

@implementation BIZHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.collectionView registerClass:[BIZPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CollectionView Delegates

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    BIZPhotoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    //cell.backgroundColor  = [UIColor colorWithPatternImage:[UIImage imageNamed:@"note.png"]];
    
//    MBSNote *noteFetched = [self.fetchedResultsController objectAtIndexPath:indexPath];
//    
//    cell.name.text = noteFetched.name;
//    cell.thumbnailView.image = noteFetched.photo;
//    cell.addressLabel.text = noteFetched.address;
    

    
//    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(deleteNote:)];
//    
//    [swipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
//    
//    [cell addGestureRecognizer:swipeGesture];
    
    return cell;
}

#pragma mark Navigation buttons - Methods

- (IBAction)goToCameraOptions:(id)sender {
    
    NSLog(@"Mostramo uiActionSheet de la camara");
    // Creamos un UIImagePicker
    self.picker = [[UIImagePickerController alloc]init];
    
    // Lo configuramos
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil
                                                                delegate:self
                                                       cancelButtonTitle:@"Cancel"
                                                  destructiveButtonTitle:nil
                                                       otherButtonTitles:@"Take Photo",@"Choose Existing", nil];
        [actionSheet showInView:self.view];
        
        
    } else {
        
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

            
            self.picker.allowsEditing = YES;
            // Lo mostramos modalmente
            [self presentViewController:self.picker animated:YES completion:nil];
        
    }
    self.picker.allowsEditing = YES;
    // asignar el delegado del UIPicker
    self.picker.delegate = self;
}

#pragma mark - layoutFlow

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(30, 20, 30, 20);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize retVal = CGSizeMake(300, 290);
    
    return retVal;
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
//    self.note.photo = img;
    
    if ([[UIDevice currentDevice]userInterfaceIdiom]== UIUserInterfaceIdiomPad){
        
//        [self.popOver dismissPopoverAnimated:YES];
//        self.photoView.image = self.note.photo;
    }
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIActionSheetDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        // Lo mostramos modalmente
        if ([[UIDevice currentDevice]userInterfaceIdiom]== UIUserInterfaceIdiomPad)
        {
            [self.picker setModalInPopover:YES];
        }
        
        [self presentViewController:self.picker animated:YES completion:nil];
        
    }
    else if (buttonIndex == 1){
        
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        if ([[UIDevice currentDevice]userInterfaceIdiom]== UIUserInterfaceIdiomPad)
        {
//            UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:self.picker];
//            [pop presentPopoverFromRect:self.view.bounds inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//            self.popOver = pop;
        }
        
        else if ([[UIDevice currentDevice]userInterfaceIdiom]== UIUserInterfaceIdiomPhone){
            // Lo mostramos modalmente
            [self presentViewController:self.picker animated:YES completion:nil];
        }
    }
    
    self.picker.allowsEditing = YES;
}




















@end
