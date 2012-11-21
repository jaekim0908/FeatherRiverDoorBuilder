//
//  FRDataViewController.h
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/9/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRDataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) IBOutlet UIImageView *dataImageView;
@property (strong, nonatomic) IBOutlet UIToolbar *topMenuBar;
@property (strong, nonatomic) IBOutlet UIView *doorDetailView;
@property (strong, nonatomic) id dataObject;

- (IBAction)saveToMyFavorite:(id)sender;
- (IBAction)saveToMyFavorite2:(id)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
