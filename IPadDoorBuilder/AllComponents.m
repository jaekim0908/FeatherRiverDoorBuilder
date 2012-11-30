//
//  AllSlabComponents.m
//  IPadDoorBuilder
//
//  Created by Michael Ho on 11/23/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "AllComponents.h"
#import "DoorComponent.h"

@implementation AllComponents

@synthesize slabComponentsArray = _slabComponentsDict;
@synthesize configComponentsArray = _configComponentsDict;
@synthesize colorComponentsArray = _colorComponentsDict;
@synthesize glassComponentsArray = _glassComponentsDict;
@synthesize sideliteComponentsArray = _sideliteComponentsDict;
@synthesize jambComponentsArray = _jambComponentsDict;


static AllComponents *sharedInstance=nil;

+ (AllComponents *)sharedInstance{
    if((sharedInstance) == nil){
        sharedInstance = [[AllComponents alloc] init];
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
        //self.slabComponentsArray = [NSArray arrayWithContentsOfFile:pathOfSlabComponentsFile];
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
