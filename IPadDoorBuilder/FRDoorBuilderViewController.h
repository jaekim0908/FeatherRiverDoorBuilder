//
//  FRDoorBuilderViewController.h
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/24/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRDoorConfiguration.h"
#import "FRScrollView.h"
#import "FRImageView.h"


#define NONE 0
#define LEFT 1
#define MID 2
#define RIGHT 3

@interface FRDoorBuilderViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) FRDoorConfiguration *doorConfig;
@property (strong, nonatomic) UIImageView *imageViewInScrollView;
@property (strong, nonatomic) IBOutlet FRScrollView *selectionScrollView;
@property (strong, nonatomic) NSMutableArray *imageNames;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewLeftSideLite;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewRightSideLite;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewMidSingleDoor;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewLeftSingleDoor;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewRightSingleDoor;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewConfiguration;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewDoorFinish;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewPrePaintColor;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewJambs;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewGlass;

-(void)centerScrollViewContents;
-(void)showSelectionScrollViewByTag:(int) tag;
-(void)setUserChoice:(int) compType withItemId:(int) itemId toTargetImageView:(UIImageView *) imageView withImage:(NSString *) imageName;
-(IBAction) startOver:(id)sender;

@end
