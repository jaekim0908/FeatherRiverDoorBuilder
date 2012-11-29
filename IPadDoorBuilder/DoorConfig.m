//
//  DoorConfig.m
//  DoorBuilder2
//
//  Created by Michael Ho on 11/6/12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import "DoorConfig.h"

@implementation DoorConfig

@synthesize slab = _slab;
@synthesize color = _color;
@synthesize glass = _glass;
@synthesize sidelite = _sidelite;
@synthesize config = _config;
@synthesize jamb = _jamb;



- (id)init:(int)slab color:(int)color glass:(int)glass sidelite:(int)sidelite config:(int) config jamb:(int)jamb{
    
    if((self = [super init])){
        self.slab = slab;
        self.color = color;
        self.glass = glass;
        self.sidelite = sidelite;
        self.config = config;
        self.jamb = jamb;
    }
    return self;
}

@end
