//
//  FRModelController.h
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/9/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FRDataViewController;

@interface FRModelController : NSObject <UIPageViewControllerDataSource>

- (FRDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(FRDataViewController *)viewController;

@end
