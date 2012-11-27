//
//  AllSlabComponents.h
//  IPadDoorBuilder
//
//  Created by Michael Ho on 11/23/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllSlabComponents : NSObject{
    NSArray *_slabComponentsArray;
    NSArray *_configComponentsArray;
    NSArray *_colorComponentsArray;
    NSArray *_glassComponentsArray;
    NSArray *_sideliteComponentsArray;
    NSArray *_jambComponentsArray;
}

@property (nonatomic,strong) NSArray *slabComponentsArray;
@property (nonatomic,strong) NSArray *configComponentsArray;
@property (nonatomic,strong) NSArray *colorComponentsArray;
@property (nonatomic,strong) NSArray *glassComponentsArray;
@property (nonatomic,strong) NSArray *sideliteComponentsArray;
@property (nonatomic,strong) NSArray *jambComponentsArray;

+ (id)sharedInstance;

@end
