//
//  DoorConfigDatabase.h
//  DoorBuilder2
//
//  Created by Michael Ho on 11/6/12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "DoorConfig.h"

@interface DoorConfigDatabase : NSObject{
    sqlite3 *_databaseConn;
}

+ (DoorConfigDatabase*)database;
- (NSDictionary *)doorConfigInfo:(DoorConfig *)currentChoices requestedType:(NSString *)desiredType;



@end
