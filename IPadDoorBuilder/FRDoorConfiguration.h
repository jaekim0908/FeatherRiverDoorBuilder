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

enum ComType {no_configuration = 0, configuration, slab, sitelite, glass, prepaint_color, door_finish, jambs, slab_with_glass};
enum ConfigType {D = 100, SD, DS, DD};
enum Glass {NO_GLASS = 200, LAK, MED, PRS, SVD, MOR, TOR};
enum SLAB {NO_SLAB = 700, _150, _550, _555, _243, _248, _400, _420, _425, _430, _440, _445, _460};
enum Caming {NO_CAMING = 300, brass, patina, zinc, wrought_iron};
enum DoorFinish {NO_FINISH = 400, PWM, CY, CS, CL, LO, MO, WO, U, S};
enum PrePaintColor {NO_COLOR = 500, PW, AW, CG, HS, PS, DR, FW, SG, NV, CB, BB, TB, RS, RB};

@interface FRDoorConfiguration : NSObject

@property int configType;
@property NSString *slabOnlyName;
@property NSString *glassOnlyName;
@property NSString *doorFinishTypeName;
@property NSString *siteLiteName;
@property NSString *prePaintColorName;
@property NSString *camingName;

+(FRDoorConfiguration *) createDoorConfigurationSingleton;
-(void) print;
-(void) reset;

@end
