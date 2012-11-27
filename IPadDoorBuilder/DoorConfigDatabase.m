//
//  DoorConfigDatabase.m
//  DoorBuilder2
//
//  Created by Michael Ho on 11/6/12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import "DoorConfigDatabase.h"
#import "DoorConfig.h"
#import "AllComponents.h"

@implementation DoorConfigDatabase

static DoorConfigDatabase *_database;


+ (DoorConfigDatabase*)database{
    if(_database == nil){
        _database = [[DoorConfigDatabase alloc] init];
    }
    return _database;
}

- (id)init{
    if((self = [super init])){
        //NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"sqlite3"];
        NSString *sqLiteDb = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"test.sqlite3"];
        
        NSLog(@"my DB path:%@", sqLiteDb);
        //if(sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK){
        if(sqlite3_open([sqLiteDb UTF8String], &_databaseConn) != SQLITE_OK){
            NSLog(@"Failed to open database!");
        }
    
    }
    return self;
}

- (NSDictionary *)doorConfigInfo:(DoorConfig *)currentChoices requestedType:(NSString *)desiredType {

    //TO DO: change DB column from sidelites to sidelite
    //NSString *query = @"SELECT slab, color, glass, sidelites, jambs FROM door_config;";
    NSMutableString *query = [[NSMutableString alloc] initWithCapacity:1];
    [query setString:@"SELECT distinct a."];
    [query appendString:desiredType];
    [query appendString:@" from door_slab_color_glass_sidelite a, door_config_color_jamb b "];
    [query appendString:@"where "];
    if(currentChoices.slab){ [query appendString:[NSString stringWithFormat:@"slab=%d and ",currentChoices.slab]];}
    if(currentChoices.color){ [query appendString:[NSString stringWithFormat:@"color=%d and ",currentChoices.color]];}
    if(currentChoices.glass){ [query appendString:[NSString stringWithFormat:@"glass=%d and ",currentChoices.glass]];}
    if(currentChoices.sidelite){ [query appendString:[NSString stringWithFormat:@"sidelite=%d and ",currentChoices.sidelite]];}
    if(currentChoices.config){ [query appendString:[NSString stringWithFormat:@"config=%d and ",currentChoices.config]];}
    if(currentChoices.jamb){ [query appendString:[NSString stringWithFormat:@"jamb=%d and ",currentChoices.jamb]];}
    [query appendString:@"a.color=b.color;"];
    
    NSLog(@"The query:%@",query);
    
    sqlite3_stmt *statement;
    int rc;
    
    NSMutableArray *validComponentIds = [NSMutableArray array];
    
    //CREATE THE ARRAY OF VALID COMPONENT IDS
    if ((rc = sqlite3_prepare_v2(_databaseConn, [query UTF8String], -1, &statement, nil)) == SQLITE_OK){
    
        NSLog(@"LOOPING THROUGH VALID COMPONENT IDS");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            
            int componentId = sqlite3_column_int(statement, 0);
            NSNumber *wrappedComponentId = [NSNumber numberWithInt:componentId];
            
            //add componentId to array of valid component Ids
            [validComponentIds addObject:wrappedComponentId];
        }
        sqlite3_finalize(statement);
    }
    
    //GET ALL SLAB COMPONENTS
    AllComponents *slabComponentsSingleton = [AllComponents sharedInstance];
    
    //LOOP THROUGH EACH COMPONENT AND PLACE IN EITHER THE VALID OR INVALID COMPONENT ARRAY
    NSMutableArray *validComponents = [NSMutableArray array];
    NSMutableArray *invalidComponents = [NSMutableArray array];
    NSArray *componentsArray;
    
    //ASSIGN THE componentsArray TO THE PROPER COMPONENT ARRAY BASED ON THE SPECIFIED desiredType
    if([desiredType isEqualToString:@"slab"]){
        componentsArray = [slabComponentsSingleton slabComponentsArray];
    }
    else if([desiredType isEqualToString:@"config"]){
        componentsArray = [slabComponentsSingleton configComponentsArray];
    }
    else if([desiredType isEqualToString:@"color"]){
        componentsArray = [slabComponentsSingleton colorComponentsArray];
    }
    else if([desiredType isEqualToString:@"glass"]){
        componentsArray = [slabComponentsSingleton glassComponentsArray];
    }
    else if([desiredType isEqualToString:@"sidelite"]){
        componentsArray = [slabComponentsSingleton sideliteComponentsArray];
    }
    else if([desiredType isEqualToString:@"jamb"]){
        componentsArray = [slabComponentsSingleton jambComponentsArray];
    }
            
    //LOOP THROUGH ALL OF THE COMPONENTS AND PLACE THE VALID COMPONENTS IN ONE ARRAY
    //AND THE INVALID COMPONENTS IN THE OTHER
    for (NSDictionary *componentEntry in componentsArray){
        
        BOOL populateValidComponentsArray=FALSE;
        id componentId = [componentEntry valueForKey:@"Id"];
        
        for (NSNumber *validComponentId in validComponentIds) {
            if ([validComponentId intValue] == [componentId intValue]) {
                populateValidComponentsArray=TRUE;
                break;
            }
        }
        
        if(populateValidComponentsArray){
            [validComponents addObject:componentEntry];
        }
        else{
            [invalidComponents addObject:componentEntry];
        }
    }
    
    NSMutableDictionary *validAndInvalidComponents = [[NSMutableDictionary alloc] init];
    //ADD VALID COMPONENTS TO RETURNED ARRAY
    [validAndInvalidComponents setObject:validComponents forKey:@"ValidComponents"];
    [validAndInvalidComponents setObject:invalidComponents forKey:@"InvalidComponents"];

    
    return validAndInvalidComponents;
    
}

- (void)dealloc{
    sqlite3_close(_databaseConn);
}

@end
