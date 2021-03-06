//
//  FRModelController.m
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/9/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "FRModelController.h"

#import "FRDataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface FRModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation FRModelController

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        _pageData = [NSArray arrayWithObjects:[NSString stringWithFormat:@"App-Bty-LAK430bMO.png"],
                     [NSString stringWithFormat:@"App-Bty-MED248bCY.png"],
                     [NSString stringWithFormat:@"App-Bty-MOR425zCS.png"],
                     [NSString stringWithFormat:@"App-Bty-PRS445pCL.png"],
                     [NSString stringWithFormat:@"App-Bty-SVD460zLO.png"],
                     [NSString stringWithFormat:@"App-Bty-TOR550WWO.png"],
                     nil];
    }
    return self;
}

- (FRDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    FRDataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"FRDataViewController"];
    dataViewController.dataObject = [self.pageData objectAtIndex:index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(FRDataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(FRDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(FRDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
