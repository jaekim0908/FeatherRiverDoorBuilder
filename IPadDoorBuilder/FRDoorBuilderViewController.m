//
//  FRDoorBuilderViewController.m
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/24/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "FRDoorBuilderViewController.h"

@implementation FRDoorBuilderViewController

@synthesize doorConfig = _doorConfig;
@synthesize imageViewInScrollView = _imageViewInScrollView;
@synthesize imageNames = _imageNames;
@synthesize imageViewLeftSideLite = _imageViewLeftSideLite;
@synthesize imageViewRightSideLite = _imageViewRightSideLite;
@synthesize imageViewMidSingleDoor = _imageViewMidSingleDoor;
@synthesize imageViewLeftSingleDoor = _imageViewLeftSingleDoor;
@synthesize imageViewRightSingleDoor = _imageViewRightSingleDoor;
@synthesize selectionScrollView = _selectionScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.selectionScrollView];
    self.selectionScrollView.delegate = self;
    self.doorConfig = [FRDoorConfiguration createDoorConfigurationSingleton];
	// Do any additional setup after loading the view.
    if (self.doorConfig.configType < 0) {
        NSLog(@"No Frame is selected. Pop up window");
        [self addConfigurationImagesToScrollView];
        [self displaySelectionScrollView];
    }
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

-(void)removeImagesFromScrollView {
    NSLog(@"subview count = %i", self.selectionScrollView.subviews.count);
    NSArray *subviews = self.selectionScrollView.subviews;
    for(UIView *view in subviews) {
        [view removeFromSuperview];
    }
}

-(void) showDoorSelections:(int) pos {
    
    [self removeImagesFromScrollView];
    
    self.imageNames = [[NSMutableArray alloc] initWithObjects:
                       [UIImage imageNamed:@"LAK243bLO.png"],
                       [UIImage imageNamed:@"LAK243bMO.png"],
                       [UIImage imageNamed:@"LAK243bU.png"],
                       [UIImage imageNamed:@"LAK243bWO.png"],
                       [UIImage imageNamed:@"MED243bLO.png"],
                       [UIImage imageNamed:@"MED248bCY.png"],
                       [UIImage imageNamed:@"MED243bMO.png"],
                       [UIImage imageNamed:@"MED400bMO.png"],
                       [UIImage imageNamed:@"MED430bLO.png"],
                       [UIImage imageNamed:@"MED430bMO.png"],
                       [UIImage imageNamed:@"MED430bS.png"],
                       [UIImage imageNamed:@"MED430bU.png"],
                       [UIImage imageNamed:@"MED430bWO.png"],
                       nil];
    int x = 20;
    int y = 20;
    
    for(int i = 0; i < [self.imageNames count]; i++) {
        FRImageView *imageView = [[FRImageView alloc] initWithFrame:CGRectMake(x, y, 130, 230)];
        imageView.image = [self.imageNames objectAtIndex:i];
        imageView.doorBuilder = self;
        imageView.compType = SlabType;
        if (pos == LEFT) {
            imageView.targetImageView = self.imageViewLeftSingleDoor;
        } else if (pos == MID) {
            imageView.targetImageView = self.imageViewMidSingleDoor;
        } else {
            imageView.targetImageView = self.imageViewRightSingleDoor;
        }
        [self.selectionScrollView addSubview:imageView];
        x += 200;
    }
    
    self.selectionScrollView.contentSize = CGSizeMake(x,y);
    [self displaySelectionScrollView];
}

-(void) showSideLiteSelections:(int) pos {
    
    [self removeImagesFromScrollView];
    
    self.imageNames = [[NSMutableArray alloc] initWithObjects:
                       [UIImage imageNamed:@"SIDELITE1.png"],
                       [UIImage imageNamed:@"SIDELITE2.png"],
                       [UIImage imageNamed:@"SIDELITE3.png"],
                       [UIImage imageNamed:@"SIDELITE4.png"],
                       [UIImage imageNamed:@"SIDELITE5.png"],
                       [UIImage imageNamed:@"SIDELITE6.png"],
                       [UIImage imageNamed:@"SIDELITE7.png"],
                       [UIImage imageNamed:@"SIDELITE8.png"],
                       [UIImage imageNamed:@"SIDELITE9.png"],
                       [UIImage imageNamed:@"SIDELITE10.png"],
                       [UIImage imageNamed:@"SIDELITE11.png"],
                       [UIImage imageNamed:@"SIDELITE12.png"],
                       [UIImage imageNamed:@"SIDELITE13.png"],
                       nil];
    int x = 20;
    int y = 20;
    
    for(int i = 0; i < [self.imageNames count]; i++) {
        FRImageView *imageView = [[FRImageView alloc] initWithFrame:CGRectMake(x, y, 130, 230)];
        imageView.image = [self.imageNames objectAtIndex:i];
        imageView.doorBuilder = self;
        imageView.compType = SideLiteType;
        if (pos == LEFT) {
            imageView.targetImageView = self.imageViewLeftSideLite;
        } else if (pos == RIGHT){
            imageView.targetImageView = self.imageViewRightSideLite;
        }
        [self.selectionScrollView addSubview:imageView];
        x += 200;
    }
    
    self.selectionScrollView.contentSize = CGSizeMake(x,y);
    [self displaySelectionScrollView];
}

-(void)addConfigurationImagesToScrollView {
    
    self.imageNames = [[NSMutableArray alloc] initWithObjects:
                       [UIImage imageNamed:@"single_door.jpg"],
                       [UIImage imageNamed:@"single_door_with_left_sidelite.jpg"],
                       [UIImage imageNamed:@"single_door_with_right_sidelite.jpg"],
                       [UIImage imageNamed:@"single_door_with_two_sidelites.jpg"],
                       [UIImage imageNamed:@"double_door.jpg"],
                       nil];
    int x = 20;
    int y = 20;
    
    for(int i = 0; i < [self.imageNames count]; i++) {
        FRImageView *imageView = [[FRImageView alloc] initWithFrame:CGRectMake(x, y, 130, 230)];
        imageView.image = [self.imageNames objectAtIndex:i];
        imageView.doorBuilder = self;
        imageView.compType = ConfigType;
        if (i == 0) {
            imageView.itemName = [NSString stringWithFormat:@"SingleDoor"];
            imageView.itemId = 100;
        } else if (i == 1) {
            imageView.itemName = [NSString stringWithFormat:@"SingleDoorWithLeftSideLite"];
            imageView.itemId = 101;
        } else if (i == 2) {
            imageView.itemName = [NSString stringWithFormat:@"SingleDoorWithRightSideLite"];
            imageView.itemId = 102;
        } else if (i == 3) {
            imageView.itemName = [NSString stringWithFormat:@"SingleDoorWithTwoSideLite"];
            imageView.itemId = 103;
        }else if (i == 4) {
            imageView.itemName = [NSString stringWithFormat:@"DoubleDoor"];
            imageView.itemId = 104;
        }
        [self.selectionScrollView addSubview:imageView];
        x += 200;
    }
    
    self.selectionScrollView.contentSize = CGSizeMake(x,y);
}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.selectionScrollView.bounds.size;
    CGRect contentsFrame = self.imageViewInScrollView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageViewInScrollView.frame = contentsFrame;
}

-(void) displaySelectionScrollView {
    if ([self.selectionScrollView isHidden]) {
        [self.selectionScrollView setHidden:FALSE];
    }
}

-(void) hideSelectionScrollView {
    if (![self.selectionScrollView isHidden]) {
        [self.selectionScrollView setHidden:TRUE];
    }
}

-(void) showSelectionScrollViewByTag:(int) tag {
    [self removeImagesFromScrollView];
    if ([self.selectionScrollView isHidden]) {
        //[self centerScrollViewContents];
        [self.selectionScrollView setHidden:FALSE];
    } else {
        [self.selectionScrollView setHidden:TRUE];
    }
    //[self.view addSubview:self.selectionScrollView];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch");
    UITouch *touch = [touches anyObject];
    NSLog(@"view class = %@", [[touch view] class]);
    UIView *view = [touch view];
    NSLog(@"view tag = %i", [view tag]);
    if ([view tag] == 99) {
        [self showSideLiteSelections:LEFT];
    } else if ([view tag] == 100) {
        [self showDoorSelections:LEFT];
    } else if ([view tag] == 101) {
        [self showDoorSelections:MID];
    } else if ([view tag] == 102) {
        [self showDoorSelections:RIGHT];
    } else if ([view tag] == 103) {
        [self showSideLiteSelections:RIGHT];
    } else {
        [self hideSelectionScrollView];
    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch ended");
}

-(void)setUserChoice:(NSString *) compType withItemId:(int) itemId toTargetImageView:(UIImageView *) imageView {
    if (compType == ConfigType) {
        [self setNewConfigurationTypeWithItemId:itemId];
    } else if (compType == GlassType){
        self.doorConfig.glassType = itemId;
    } else if (compType == SlabType) {
        NSLog(@"comType is slabtype. showing an image");
        [imageView setImage:[UIImage imageNamed:@"TOR550wWO.png"]];
    } else if (compType == SideLiteType) {
        NSLog(@"comType is sidelite. showing an image");
        [imageView setImage:[UIImage imageNamed:@"LARGE_SITELITE1.png"]];
    }
}

-(void) hideAllConfigurationImages {
    [self.imageViewLeftSideLite setHidden:TRUE];
    [self.imageViewRightSideLite setHidden:TRUE];
    [self.imageViewMidSingleDoor setHidden:TRUE];
    [self.imageViewLeftSingleDoor setHidden:TRUE];
    [self.imageViewRightSingleDoor setHidden:TRUE];
}

-(void) setNewConfigurationTypeWithItemId:(int) itemId {
    [self hideAllConfigurationImages];
    self.doorConfig.configType = itemId;
    if (itemId == 100) {
        [self.imageViewMidSingleDoor setHidden:FALSE];
    } else if (itemId == 101) {
        [self.imageViewLeftSideLite setHidden:FALSE];
        [self.imageViewMidSingleDoor setHidden:FALSE];
    } else if (itemId == 102) {
        [self.imageViewMidSingleDoor setHidden:FALSE];
        [self.imageViewRightSideLite setHidden:FALSE];
    } else if (itemId == 103) {
        [self.imageViewLeftSideLite setHidden:FALSE];
        [self.imageViewRightSideLite setHidden:FALSE];
        [self.imageViewMidSingleDoor setHidden:FALSE];
    } else if (itemId == 104) {
        [self.imageViewLeftSingleDoor setHidden:FALSE];
        [self.imageViewRightSingleDoor setHidden:FALSE];
    }
    [self hideSelectionScrollView];
}

@end
