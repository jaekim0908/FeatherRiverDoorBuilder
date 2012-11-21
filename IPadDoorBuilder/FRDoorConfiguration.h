//
//  FRDoorConfiguration.h
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/25/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const ConfigType;;
extern NSString *const GlassType;
extern NSString *const SlabType;
extern NSString *const SideLiteType;


@interface FRDoorConfiguration : NSObject

@property int configType;
@property int glassType;

+(FRDoorConfiguration *) createDoorConfigurationSingleton;

@end
