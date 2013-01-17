//
//  FRDoorConfiguration.m
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/25/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import "FRDoorConfiguration.h"

@implementation FRDoorConfiguration

static FRDoorConfiguration *_doorConfiguratioinSingleton;
NSString *const ConfigType = @"Config";
NSString *const GlassType = @"Glass";
NSString *const SlabType  = @"Slab";
NSString *const SideLiteType = @"Sidelite";

@synthesize slabOnlyName = _slabOnlyName;
@synthesize glassOnlyName = _glassOnlyName;
@synthesize doorFinishTypeName = _doorFinshTypeName;
@synthesize siteLiteName = _siteLiteName;
@synthesize prePaintColorName = prePaintColorName;
@synthesize camingName = _camingName;
@synthesize configType = _configType;

+(FRDoorConfiguration *) createDoorConfigurationSingleton {
    @synchronized([FRDoorConfiguration class]) {
        if (!_doorConfiguratioinSingleton) {
            _doorConfiguratioinSingleton = [super alloc];
            _doorConfiguratioinSingleton = [_doorConfiguratioinSingleton init];
        }
        
        return _doorConfiguratioinSingleton;
    }
}

-(id) init {
    
    if (self = [super init]) {
        self.slabOnlyName = nil;
        self.glassOnlyName = nil;
        self.doorFinishTypeName = nil;
        self.siteLiteName = nil;
        self.prePaintColorName = nil;
        self.camingName = nil;
    }
    
    return self;
}

-(void) reset {
    self.configType = no_configuration;
    self.slabOnlyName = nil;
    self.glassOnlyName = nil;
    self.doorFinishTypeName = nil;
    self.siteLiteName = nil;
    self.prePaintColorName = nil;
    self.camingName = nil;
}

-(void) print {
    NSLog(@"==================================================");
    NSLog(@"slab only name = %@", self.slabOnlyName);
    NSLog(@"glass only name = %@", self.glassOnlyName);
    NSLog(@"door finish type name = %@", self.doorFinishTypeName);
    NSLog(@"caming name = %@", self.camingName);
    NSLog(@"pre-paint name = %@", self.prePaintColorName);
    NSLog(@"==================================================");
}

@end
