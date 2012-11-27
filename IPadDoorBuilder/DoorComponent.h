//
//  DoorComponent.h
//  DoorBuilder2
//
//  Created by Michael Ho on 11/19/12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoorComponent : NSObject{
    NSString *_componentType;
    int       _componentId;
    NSString *_componentDescription;
    NSString *_smallImagePath;
    NSString *_largeImagePath;
}

@property (nonatomic,strong) NSString *componentType;
@property (nonatomic,assign) int componentId;
@property (nonatomic,strong) NSString *componentDescription;
@property (nonatomic,strong) NSString *smallImagePath;
@property (nonatomic,strong) NSString *largeImagePath;


@end