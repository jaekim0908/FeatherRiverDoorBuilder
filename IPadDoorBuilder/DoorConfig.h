//
//  DoorConfig.h
//  DoorBuilder2
//
//  Created by Michael Ho on 11/6/12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoorConfig : NSObject{
    int _slab;
    int _color;
    int _glass;
    int _sidelite;
    int _config;
    int _jamb;
}

@property (nonatomic,assign) int slab;
@property (nonatomic,assign) int color;
@property (nonatomic,assign) int glass;
@property (nonatomic,assign) int sidelite;
@property (nonatomic,assign) int config;
@property (nonatomic,assign) int jamb;

- (id)init:(int)slab color:(int)color glass:(int)glass sidelite:(int)sidelite config:(int) config jamb:(int)jamb;

@end
