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

@synthesize configType = _configType;
@synthesize glassType = _glassType;

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
        self.configType = -1;
        self.glassType = -1;
    }
    
    return self;
}

@end
