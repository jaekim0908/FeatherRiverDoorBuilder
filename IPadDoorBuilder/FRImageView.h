//
//  FRImageView.h
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 11/7/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRDoorBuilderViewController.h"

@class FRDoorBuilderViewController;

@interface FRImageView : UIImageView

@property (strong, nonatomic) FRDoorBuilderViewController *doorBuilder;
@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) UIImageView *targetImageView;
@property (strong, nonatomic) NSString *imageName;
@property int compType;
@property int itemId;

@end
