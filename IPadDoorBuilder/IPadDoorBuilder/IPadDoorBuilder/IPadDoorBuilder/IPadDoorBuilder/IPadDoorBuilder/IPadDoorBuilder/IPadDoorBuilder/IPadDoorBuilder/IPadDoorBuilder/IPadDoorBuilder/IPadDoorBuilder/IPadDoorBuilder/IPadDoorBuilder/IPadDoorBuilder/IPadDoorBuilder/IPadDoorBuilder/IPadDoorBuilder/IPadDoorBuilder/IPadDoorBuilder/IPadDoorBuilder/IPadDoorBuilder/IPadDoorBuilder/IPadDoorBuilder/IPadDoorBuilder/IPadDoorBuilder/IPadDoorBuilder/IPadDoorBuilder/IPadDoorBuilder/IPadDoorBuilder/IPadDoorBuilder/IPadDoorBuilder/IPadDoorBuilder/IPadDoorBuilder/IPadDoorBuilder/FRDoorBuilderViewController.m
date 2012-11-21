//
//  FRDoorBuilderViewController.m
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/24/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "FRDoorBuilderViewController.h"

@interface FRDoorBuilderViewController ()

@end

@implementation FRDoorBuilderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
