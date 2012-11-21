//
//  FRDataViewController.m
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/9/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "FRDataViewController.h"

@interface FRDataViewController ()

@end

@implementation FRDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.dataLabel = nil;
    self.dataImageView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
    NSLog(@"data object description = %@", [self.dataObject  description]);
    UIImage *image = [UIImage imageNamed:[self.dataObject  description]];
    NSAssert(image, @"image is nil. Check that you added the image to your bundle");
    self.dataImageView.image = image;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)saveToMyFavorite:(id)sender {
    NSLog(@"save button clicked");
    if ([self.doorDetailView isHidden]) {
        [self.doorDetailView setHidden:FALSE];
    } else {
        [self.doorDetailView setHidden:TRUE];
    }
}

- (IBAction)saveToMyFavorite2:(id)sender {
    NSLog(@"save button2 clicked");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch began detected");
}

@end
