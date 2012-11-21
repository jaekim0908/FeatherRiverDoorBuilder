//
//  FRScrollView.m
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 11/7/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "FRScrollView.h"

@implementation FRScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"scroll view: touch");
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
