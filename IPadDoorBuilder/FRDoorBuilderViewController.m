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
@synthesize imageViewConfiguration = _imageViewConfiguration;
@synthesize imageViewDoorFinish = _imageViewDoorFinish;
@synthesize imageViewPrePaintColor = _imageViewPrePaintColor;
@synthesize imageViewJambs = _imageViewJambs;
@synthesize imageViewGlass = _imageViewGlass;
@synthesize selectionScrollView = _selectionScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.selectionScrollView];
    self.selectionScrollView.delegate = self;
    self.doorConfig = [FRDoorConfiguration createDoorConfigurationSingleton];
	// Do any additional setup after loading the view.
    if (self.doorConfig.configType == no_configuration) {
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

-(void) showSelectionsFor:(int) compType atPos:(int) pos {
    
    [self removeImagesFromScrollView];
    
    NSString *dir;
    NSString *dirPath;
    NSFileManager *fileMgr;
    NSMutableArray *fileList;
    NSPredicate *fileFilter;
    int startWidth = 130;
    int startHeight = 230;
    int spaceBetweenItems = 0;
    int labelWidth = 125;
    int labelHeight = 30;
    int x = 20;
    int y = 10;
    int labelX = 20;
    int labelY = 250;
    
    switch(compType) {
        case configuration:
            [self addConfigurationImagesToScrollView];
            break;
        case slab:
            //dir = [NSString stringWithFormat:@"SD-Images/SelectorScreen/SlabsOnlyDoors"];
            dirPath = [[NSBundle mainBundle] pathForResource:@"SD-Images/SelectorScreen/SlabsOnlyDoors" ofType:nil];
            spaceBetweenItems = 180;
            fileMgr =[NSFileManager defaultManager];
            fileList = [NSMutableArray arrayWithArray:[fileMgr contentsOfDirectoryAtPath:dirPath error:NULL]];
            fileFilter = [self preparePredicates:compType];
            if (fileFilter) {
                NSLog(@"being filtered");
                [fileList filterUsingPredicate:fileFilter];
            } else {
                [fileList filterUsingPredicate:
                 [NSPredicate predicateWithFormat:@"not SELF contains[c] '-'"]];
            }
            break;
        case sitelite:
            dir = [NSString stringWithFormat:@"SD-Images/SelectorScreen/SlabsOnlySidelites"];
            dirPath = [[NSBundle mainBundle] pathForResource:@"SD-Images/SelectorScreen/SlabsOnlySidelites" ofType:nil];
            x = 60;
            startWidth = 40;
            startHeight = 230;
            spaceBetweenItems = 150;
            labelWidth = 125;
            labelHeight = 30;
            fileMgr =[NSFileManager defaultManager];
            fileList = [NSMutableArray arrayWithArray:[fileMgr contentsOfDirectoryAtPath:dirPath error:NULL]];
            [fileList filterUsingPredicate:
             [NSPredicate predicateWithFormat:@"not SELF contains[c] '-'"]];
            break;
        case glass:
            dir = [NSString stringWithFormat:@"SD-Images/SelectorScreen/GlassOnly"];
            dirPath = [[NSBundle mainBundle] pathForResource:@"SD-Images/SelectorScreen/GlassOnly" ofType:nil];
            spaceBetweenItems = 180;
            labelWidth = 125;
            labelHeight = 30;
            fileMgr =[NSFileManager defaultManager];
            fileList = [NSMutableArray arrayWithArray:[fileMgr contentsOfDirectoryAtPath:dirPath error:NULL]];
            fileFilter = [self preparePredicates:compType];
            if (fileFilter) {
                [fileList filterUsingPredicate:fileFilter];
            }
            /*
            [fileList filterUsingPredicate:
             [NSPredicate predicateWithFormat:@"not SELF contains[c] '160' OR not SELF contains[c] '225' OR not SELF contains[c] '240' OR not SELF contains[c] '245' OR not SELF contains[c] '243' OR not SELF contains[c] '248'"]];
            */
            break;
        case prepaint_color:
            dir = [NSString stringWithFormat:@"SD-Images/SelectorScreen/ColorSwatches"];
            dirPath = [[NSBundle mainBundle] pathForResource:@"SD-Images/SelectorScreen/ColorSwatches" ofType:nil];
            spaceBetweenItems = 180;
            fileMgr =[NSFileManager defaultManager];
            fileList = [NSMutableArray arrayWithArray:[fileMgr contentsOfDirectoryAtPath:dirPath error:NULL]];
            break;
        case door_finish:
            dir = [NSString stringWithFormat:@"SD-Images/SelectorScreen/ColorSwatches"];
            dirPath = [[NSBundle mainBundle] pathForResource:@"SD-Images/SelectorScreen/ColorSwatches" ofType:nil];
            spaceBetweenItems = 180;
            fileMgr =[NSFileManager defaultManager];
            fileList = [NSMutableArray arrayWithArray:[fileMgr contentsOfDirectoryAtPath:dirPath error:NULL]];
            break;
        case jambs:
            dir = [NSString stringWithFormat:@"SD-Images/SelectorScreen/Jambs"];
            dirPath = [[NSBundle mainBundle] pathForResource:@"SD-Images/SelectorScreen/Jambs" ofType:nil];
            spaceBetweenItems = 180;
            fileMgr =[NSFileManager defaultManager];
            fileList = [NSMutableArray arrayWithArray:[fileMgr contentsOfDirectoryAtPath:dirPath error:NULL]];
            break;
        default:
                break;
    }
        
    for(int i = 0; i < [fileList count]; i++) {
        FRImageView *imageView = [[FRImageView alloc] initWithFrame:CGRectMake(x, y, startWidth, startHeight)];
        UILabel *imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
        imageLabel.textAlignment = UITextAlignmentCenter;
        imageLabel.text = [fileList objectAtIndex:i];
        imageLabel.textColor = [UIColor blackColor];
        [imageLabel setBackgroundColor:[UIColor orangeColor]];
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", dirPath, [fileList objectAtIndex:i]];
        imageView.image = [UIImage imageWithContentsOfFile:filePath];
        imageView.imageName = [fileList objectAtIndex:i];
        imageView.doorBuilder = self;
        switch(compType) {
            case slab:
                imageView.compType = slab;
                if (pos == LEFT) {
                    imageView.targetImageView = self.imageViewLeftSingleDoor;
                } else if (pos == MID) {
                    imageView.targetImageView = self.imageViewMidSingleDoor;
                } else {
                    imageView.targetImageView = self.imageViewRightSingleDoor;
                }
                break;
            case sitelite:
                imageView.compType = sitelite;
                if (pos == LEFT) {
                    imageView.targetImageView = self.imageViewLeftSideLite;
                } else if (pos == RIGHT){
                    imageView.targetImageView = self.imageViewRightSideLite;
                }
                break;
            case glass:
                imageView.compType = glass;
                imageView.targetImageView = self.imageViewGlass;
                break;
            case configuration:
                 NSLog(@"come type is configuration");
                imageView.compType = configuration;
                imageView.targetImageView = self.imageViewConfiguration;
                if (!self.imageViewConfiguration) {
                    NSLog(@"image view configuration is null");
                }
                break;
            case jambs:
                NSLog(@"come type is jambs");
                imageView.compType = jambs;
                if (!self.imageViewJambs) {
                    NSLog(@"image view jambs is null");
                }
                imageView.targetImageView = self.imageViewJambs;
                break;
            case prepaint_color:
                imageView.compType = prepaint_color;
                imageView.targetImageView = self.imageViewPrePaintColor;
                break;
            case door_finish:
                imageView.compType = door_finish;
                imageView.targetImageView = self.imageViewDoorFinish;
                break;
            default:
                break;
        }
        /*
        if (compType == 1) {
            imageView.compType = SlabType;
            if (pos == LEFT) {
                imageView.targetImageView = self.imageViewLeftSingleDoor;
            } else if (pos == MID) {
                imageView.targetImageView = self.imageViewMidSingleDoor;
            } else {
                imageView.targetImageView = self.imageViewRightSingleDoor;
            }
            
            CIContext *context = [CIContext contextWithOptions:nil];
            CIImage *inputImage = [[CIImage alloc] initWithImage:[UIImage imageWithContentsOfFile:filePath]];
            NSLog(@"input image = %@", inputImage);
            CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
            [blurFilter setDefaults];
            [blurFilter setValue: inputImage forKey: kCIInputImageKey];
            [blurFilter setValue: [NSNumber numberWithFloat:10.0f]
                          forKey:@"inputRadius"];
            CIImage *outputImage = [blurFilter valueForKey: kCIOutputImageKey];
            NSLog(@"output image = %@", outputImage);
            imageView.image = [UIImage imageWithCGImage:[context createCGImage:outputImage fromRect:outputImage.extent]];
        } else if (compType == 2) {
            imageView.compType = SideLiteType;
            if (pos == LEFT) {
                imageView.targetImageView = self.imageViewLeftSideLite;
            } else if (pos == RIGHT){
                imageView.targetImageView = self.imageViewRightSideLite;
            }
        }
        */
        
        [self.selectionScrollView addSubview:imageView];
        [self.selectionScrollView addSubview:imageLabel];
        
        x += spaceBetweenItems;
        labelX += spaceBetweenItems;
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
        imageView.compType = configuration;
        imageView.targetImageView = self.imageViewConfiguration;
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
    /*
    if ([view tag] == 99) {
        //[self showSideLiteSelections:LEFT];
        [self showSelectionsFor:2 atPos:LEFT];
    } else if ([view tag] == 100) {
        //[self showDoorSelections:LEFT];
        [self showSelectionsFor:1 atPos:LEFT];
    } else if ([view tag] == 101) {
        //[self showDoorSelections:MID];
        [self showSelectionsFor:1 atPos:MID];
    } else if ([view tag] == 102) {
        //[self showDoorSelections:RIGHT];
        [self showSelectionsFor:1 atPos:RIGHT];
    } else if ([view tag] == 103) {
        //[self showSideLiteSelections:RIGHT];
        [self showSelectionsFor:2 atPos:RIGHT];
    } else {
        [self hideSelectionScrollView];
    }
    */
    switch([view tag]) {
        case 99:
            [self showSelectionsFor:sitelite atPos:LEFT];
            break;
        case 100:
            [self showSelectionsFor:slab atPos:LEFT];
            break;
        case 101:
            [self showSelectionsFor:slab atPos:MID];
            break;
        case 102:
            [self showSelectionsFor:slab atPos:RIGHT];
            break;
        case 103:
            [self showSelectionsFor:sitelite atPos:RIGHT];
            break;
        case 200:
            [self showSelectionsFor:configuration atPos:NONE];
            break;
        case 201:
            [self showSelectionsFor:door_finish atPos:NONE];
            break;
        case 202:
            NSLog(@"Show Selections for Pre-Paint Color");
            break;
        case 203:
            [self showSelectionsFor:jambs atPos:NONE];
            break;
        case 300:
            [self showSelectionsFor:glass atPos:MID];
            break;
        default:
            [self hideSelectionScrollView];
            break;
    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch ended");
}

-(void)setUserChoice:(int) compType withItemId:(int) itemId toTargetImageView:(UIImageView *) imageView withImage:(NSString *) imageName {
    NSString *dir;
    NSString *path;
    
    [self parseProduct:imageName forType:compType];
    
    switch(compType) {
        case configuration:
            [self setNewConfigurationTypeWithItemId:itemId];
            dir = [NSString stringWithFormat:@"SD-Images/SelectorScreen/Configurations"];
            path =
            [[NSBundle mainBundle] pathForResource:imageName ofType:nil inDirectory:dir];
            [imageView setImage:[UIImage imageWithContentsOfFile:path]];
            break;
        case slab:
            if (self.doorConfig.glassOnlyName) {
                dir = [NSString stringWithFormat:@"SD-Images/MainScreen/GlassInDoors"];
                NSString *newImageName = [NSString stringWithFormat:@"%@%@%@%@", self.doorConfig.glassOnlyName, self.doorConfig.slabOnlyName, self.doorConfig.camingName, self.doorConfig.doorFinishTypeName];
                if (self.doorConfig.prePaintColorName) {
                    newImageName = [NSString stringWithFormat:@"%@-%@.png", newImageName, self.doorConfig.prePaintColorName];
                } else {
                    newImageName = [NSString stringWithFormat:@"%@.png", newImageName];
                }
                NSLog(@"new image name = %@", newImageName);
                path =
                [[NSBundle mainBundle] pathForResource:newImageName ofType:nil inDirectory:dir];
                [imageView setImage:[UIImage imageWithContentsOfFile:path]];
            } else {
                dir = [NSString stringWithFormat:@"SD-Images/MainScreen/SlabsOnlyDoors"];
                path =
                [[NSBundle mainBundle] pathForResource:imageName ofType:nil inDirectory:dir];
                [imageView setImage:[UIImage imageWithContentsOfFile:path]];
            }
            break;
        case sitelite:
            dir = [NSString stringWithFormat:@"SD-Images/MainScreen/SlabsOnlySidelites"];
            path =
            [[NSBundle mainBundle] pathForResource:imageName ofType:nil inDirectory:dir];
            [imageView setImage:[UIImage imageWithContentsOfFile:path]];
            break;
        case glass:
            if (self.doorConfig.slabOnlyName) {
                dir = [NSString stringWithFormat:@"SD-Images/MainScreen/GlassInDoors"];
                NSString *newImageName = [NSString stringWithFormat:@"%@%@%@%@", self.doorConfig.glassOnlyName, self.doorConfig.slabOnlyName, self.doorConfig.camingName, self.doorConfig.doorFinishTypeName];
                if (self.doorConfig.prePaintColorName) {
                    newImageName = [NSString stringWithFormat:@"%@-%@.png", newImageName, self.doorConfig.prePaintColorName];
                } else {
                    newImageName = [NSString stringWithFormat:@"%@.png", newImageName];
                }
                NSLog(@"new image name = %@", newImageName);
                path =
                [[NSBundle mainBundle] pathForResource:newImageName ofType:nil inDirectory:dir];
                [self.imageViewMidSingleDoor setImage:[UIImage imageWithContentsOfFile:path]];
            }
            dir = [NSString stringWithFormat:@"SD-Images/MainScreen/GlassOnly"];
            path =
            [[NSBundle mainBundle] pathForResource:imageName ofType:nil inDirectory:dir];
            [imageView setImage:[UIImage imageWithContentsOfFile:path]];
            break;
        case jambs:
            dir = [NSString stringWithFormat:@"SD-Images/MainScreen/Jambs"];
            path =
            [[NSBundle mainBundle] pathForResource:imageName ofType:nil inDirectory:dir];
            [imageView setImage:[UIImage imageWithContentsOfFile:path]];
            break;
        case door_finish:
            dir = [NSString stringWithFormat:@"SD-Images/MainScreen/ColorSwatches"];
            path =
            [[NSBundle mainBundle] pathForResource:imageName ofType:nil inDirectory:dir];
            [imageView setImage:[UIImage imageWithContentsOfFile:path]];
            break;
        case prepaint_color:
            dir = [NSString stringWithFormat:@"SD-Images/MainScreen/ColorSwatches"];
            path =
            [[NSBundle mainBundle] pathForResource:imageName ofType:nil inDirectory:dir];
            [imageView setImage:[UIImage imageWithContentsOfFile:path]];
            break;
        default:
            break;
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

-(void) parseProduct:(NSString *) imageName forType:(int) compType {
    
    if (!imageName) return;
    
    NSError* error = nil;
    
    NSRegularExpression* regex = nil;
    NSArray* matches = nil;
    NSString *matchText = nil;
        
    switch(compType) {
        case slab:
            regex = [NSRegularExpression regularExpressionWithPattern:@"([0-9][0-9][0-9])+(PWM|CY|CS|CL|LO|MO|WO|U|S)+[.|-]*(PW|AW|CG|HS|PS|DR|FW|SG|NV|CB|BB|TB|RS|RB)*" options:0 error:&error];
            break;
        case glass:
            regex = [NSRegularExpression regularExpressionWithPattern:@"(LAK|MED|MOR|PRS|SVD|TOR)+([0-9][0-9][0-9])+(b|z|p|w)+" options:0 error:&error];
            break;
        case jambs:
            regex = [NSRegularExpression regularExpressionWithPattern:@"-(PWM|CY|CS|CL|LO|MO|WO|U|S|Pine|Tan|White)+" options:0 error:&error];
            break;
        case sitelite:
            regex = [NSRegularExpression regularExpressionWithPattern:@"(LAK|MED|MOR|PRS|SVD|TOR)*([0-9][0-9][0-9])+(PWM-|CY-|CS-|CL-|LO-|MO-|WO-|U-|S-|-PWM|-CY|-CS|-CL|-LO|-MO|-WO|-UN|-SM|PWM.|CY.|CS.|CL.|LO.|MO.|WO.|U.|S.)+" options:0 error:&error];
            break;
        case door_finish:
            regex = [NSRegularExpression regularExpressionWithPattern:@"(PWM-|CY-|CS-|CL-|LO-|MO-|WO-|U-|S-|-PWM|-CY|-CS|-CL|-LO|-MO|-WO|-UN|-SM|PWM.|CY.|CS.|CL.|LO.|MO.|WO.|U.|S.)+" options:0 error:&error];
            break;
        default:
            break;
    }
    
    matches = [regex matchesInString:imageName options:0 range:NSMakeRange(0, [imageName length])];
    
    for(NSTextCheckingResult* match in matches) {
        matchText = [imageName substringWithRange:[match range]];
        NSLog(@"match: %@", matchText);
        NSLog(@"number of ranges = %i", [match numberOfRanges]);
        
        for(int j = 0; j < [match numberOfRanges]; j++) {
            
            NSLog(@"range = %i", [match rangeAtIndex:j].length);
            
            if ([match rangeAtIndex:j].length > 0) {
                NSLog(@"group %i: %@", j, [imageName substringWithRange:[match rangeAtIndex:j]]);
                NSString *item = [imageName substringWithRange:[match rangeAtIndex:j]];
                switch(compType) {
                    case slab:
                        switch(j) {
                            case 1:
                                self.doorConfig.slabOnlyName = item;
                                break;
                            case 2:
                                self.doorConfig.doorFinishTypeName = item;
                                break;
                            case 3:
                                self.doorConfig.prePaintColorName = item;
                                break;
                        }
                        break;
                    case glass:
                        switch(j) {
                            case 1:
                                self.doorConfig.glassOnlyName = item;
                                break;
                            case 2:
                                self.doorConfig.slabOnlyName = item;
                                break;
                            case 3:
                                self.doorConfig.camingName = item;
                                break;
                        }
                        break;
                        
                }
                
            }
        }
    }
    
    [self.doorConfig print];
}

-(NSPredicate *) preparePredicates:(int) compType {
    
    NSPredicate *result = nil;
    
    switch(compType) {
        case configuration:
            break;
        case slab:
            NSLog(@"prepare predicate - slab");
            NSLog(@"prepare predicate - glass only name = %@", self.doorConfig.glassOnlyName);
            if ([self.doorConfig.glassOnlyName isEqualToString:@"LAK"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] %@ AND not SELF contains[c] '420' AND not SELF contains[c] '425'", self.doorConfig.slabOnlyName];
            } else if ([self.doorConfig.glassOnlyName isEqualToString:@"MED"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] %@ AND not SELF contains[c] '440' AND not SELF contains[c] '445' AND not SELF contains[c] '420' AND not SELF contains[c] '425' AND not SELF contains[c] '460'", self.doorConfig.slabOnlyName];
            } else if ([self.doorConfig.glassOnlyName isEqualToString:@"MOR"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] %@ AND not SELF contains[c] '400' AND not SELF contains[c] '460'", self.doorConfig.slabOnlyName];
            } else if ([self.doorConfig.glassOnlyName isEqualToString:@"PRS"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] %@ AND not SELF contains[c] '150' AND not SELF contains[c] '550' AND not SELF contains[c] '555' AND not SELF contains[c] '243' AND not SELF contains[c] '248'", self.doorConfig.slabOnlyName];
            } else if ([self.doorConfig.glassOnlyName isEqualToString:@"SVD"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] %@ AND not SELF contains[c] '420' AND not SELF contains[c] '425'", self.doorConfig.slabOnlyName];
            } else if ([self.doorConfig.glassOnlyName isEqualToString:@"TOR"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] %@ AND not SELF contains[c] '420' AND not SELF contains[c] '425' AND not SELF contains[c] '400' AND not SELF contains[c] '430'", self.doorConfig.slabOnlyName];
            }
            break;
        case sitelite:
            break;
        case glass:
            if ([self.doorConfig.slabOnlyName isEqualToString:@"150"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '150' OR SELF contains[c] '550' OR SELF contains[c] '555'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"550"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '150' OR SELF contains[c] '550' OR SELF contains[c] '555'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"555"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '150' OR SELF contains[c] '550' OR SELF contains[c] '555'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"243"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '243' OR SELF contains[c] '248'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"248"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '243' OR SELF contains[c] '248'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"400"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '400'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"420"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '420' OR SELF contains[c] '425'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"425"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '420' OR SELF contains[c] '425'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"430"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '430'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"440"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '440' OR SELF contains[c] '445'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"445"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '440' OR SELF contains[c] '445'"];
            } else if ([self.doorConfig.slabOnlyName isEqualToString:@"460"]) {
                result = [NSPredicate predicateWithFormat:@"SELF contains[c] '460'"];
            }
            break;
        case prepaint_color:
            break;
        case door_finish:
            break;
        case jambs:
            break;
        default:
            break;
    }
    
    return result;

}

-(IBAction) startOver:(id)sender {
    [self.doorConfig reset];
    self.imageViewMidSingleDoor.image = nil;
    self.imageViewPrePaintColor.image = nil;
    self.imageViewDoorFinish.image = nil;
    self.imageViewGlass.image = nil;
    self.imageViewJambs.image = nil;
    self.imageViewLeftSideLite.image = nil;
    self.imageViewRightSideLite.image = nil;
    self.imageViewLeftSingleDoor.image = nil;
    self.imageViewRightSingleDoor.image = nil;    
}

@end
