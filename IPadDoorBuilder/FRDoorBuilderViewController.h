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


#define LEFT 0
#define MID 1
#define RIGHT 2

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

-(void)centerScrollViewContents;
-(void)showSelectionScrollViewByTag:(int) tag;
-(void)setUserChoice:(NSString *) compType withItemId:(int) itemId toTargetImageView:(UIImageView *) imageView;


@end
