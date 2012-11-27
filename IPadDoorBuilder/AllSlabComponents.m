//
//  AllSlabComponents.m
//  IPadDoorBuilder
//
//  Created by Michael Ho on 11/23/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "AllSlabComponents.h"
#import "DoorComponent.h"

@implementation AllSlabComponents

@synthesize slabComponentsArray = _slabComponentsArray;
@synthesize configComponentsArray = _configComponentsArray;
@synthesize colorComponentsArray = _colorComponentsArray;
@synthesize glassComponentsArray = _glassComponentsArray;
@synthesize sideliteComponentsArray = _sideliteComponentsArray;
@synthesize jambComponentsArray = _jambComponentsArray;


static AllSlabComponents *sharedInstance=nil;

+ (AllSlabComponents *)sharedInstance{
    if((sharedInstance) == nil){
        sharedInstance = [[AllSlabComponents alloc] init];
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        //initialize code here
         NSString *pathOfSlabComponentsFile = [[NSBundle mainBundle] pathForResource:@"slabComponents" ofType:@"plist"];
         NSString *pathOfConfigComponentsFile = [[NSBundle mainBundle] pathForResource:@"configComponents" ofType:@"plist"];
         NSString *pathOfColorComponentsFile = [[NSBundle mainBundle] pathForResource:@"colorComponents" ofType:@"plist"];
         NSString *pathOfGlassComponentsFile = [[NSBundle mainBundle] pathForResource:@"glassComponents" ofType:@"plist"];
         NSString *pathOfSideliteComponentsFile = [[NSBundle mainBundle] pathForResource:@"sideliteComponents" ofType:@"plist"];
         NSString *pathOfJambComponentsFile = [[NSBundle mainBundle] pathForResource:@"jambComponents" ofType:@"plist"];
        
        //POPULATE THE ARRAY WITH THE CONTENTS OF THE PLIST
        self.slabComponentsArray = [NSArray arrayWithContentsOfFile:pathOfSlabComponentsFile];
        self.configComponentsArray = [NSArray arrayWithContentsOfFile:pathOfConfigComponentsFile];
        self.colorComponentsArray = [NSArray arrayWithContentsOfFile:pathOfColorComponentsFile];
        self.glassComponentsArray = [NSArray arrayWithContentsOfFile:pathOfGlassComponentsFile];
        self.sideliteComponentsArray = [NSArray arrayWithContentsOfFile:pathOfSideliteComponentsFile];
        self.jambComponentsArray = [NSArray arrayWithContentsOfFile:pathOfJambComponentsFile];
        
        //TEST - CONFIRM THE ARRAY IS POPULATED
        //for(NSDictionary *slabComponentEntry in self.componentsArray){
        //    NSLog(@"Description:%@",[slabComponentEntry valueForKey:@"Description"]);
        //    NSLog(@"Id:%@",[slabComponentEntry valueForKey:@"Id"]);
            
        //}
        
    }
    return self;
    
}


@end
