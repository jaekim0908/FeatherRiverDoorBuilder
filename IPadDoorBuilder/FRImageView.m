//
//  FRImageView.m
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 11/7/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "FRImageView.h"

@implementation FRImageView

@synthesize doorBuilder = _doorBuilder;
@synthesize compType = _compType;
@synthesize itemName = _itemName;
@synthesize itemId = _itemId;
@synthesize targetImageView = _targetImageView;
@synthesize imageName = _imageName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setMultipleTouchEnabled:YES];
        [self setUserInteractionEnabled:YES];
        self.itemId = -1;
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //NSAssert(self.doorBuilder != NULL, @"Door Builder is null in FRImageView");
    //NSAssert(self.comp_type != NULL, @"Component Type is null in FRImageView");
    //NSAssert(self.item_name != NULL, @"Item Name is null in FRImageView");
    //NSAssert(self.item_id >= 0, @"Item Id is not set in FRImageView");
    NSLog(@"tagetImageView = %@", self.targetImageView);
    NSLog(@"comp_type = %i", self.compType);
    NSLog(@"item_name = %@", self.itemName);
    NSLog(@"item_id = %i", self.itemId);
    NSLog(@"image name = %@", self.imageName);
    [self.doorBuilder setUserChoice:self.compType withItemId:self.itemId toTargetImageView:self.targetImageView withImage:self.imageName];
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
