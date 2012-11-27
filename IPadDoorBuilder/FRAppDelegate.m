//
//  FRAppDelegate.m
//  IPadDoorBuilder
//
//  Created by Kim, Jae on 10/9/12.
//  Copyright (c) 2012 Feather River. All rights reserved.
//
// MHO ADDITIONAL COMMENT
#import "FRAppDelegate.h"
#import "AllSlabComponents.h"
#import "DoorConfigDatabase.h"
#import "DoorConfig.h"



@implementation FRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //NSLog(@"MH: inside the delegate.");
    /*******
    AllSlabComponents *slabComponentsSingleton = [AllSlabComponents sharedInstance];
    
    //TEST - CONFIRM THE ARRAY IS POPULATED
    for(NSDictionary *slabComponentEntry in [slabComponentsSingleton componentsArray]){
   
        NSLog(@"Description:%@",[slabComponentEntry valueForKey:@"Description"]);
        NSLog(@"Id:%@",[slabComponentEntry valueForKey:@"Id"]);
        NSLog(@"All:%@",[slabComponentEntry allValues]);
        
        
        for ( NSString *key in slabComponentEntry) {
            NSLog(@"Key:%@, Value for Key:%@",key,[slabComponentEntry valueForKey:key]);
        }
    }
     *******/

    int slab=1;
    int color=0;
    int glass=0;
    int sidelite=6;
    int config=1;
    int jamb=0;
    
    DoorConfig *currentChoices = [[DoorConfig alloc] init:slab color:color glass:glass sidelite:sidelite config:config jamb:jamb];
    
    NSDictionary *validAndInvalidComponents = [[DoorConfigDatabase database] doorConfigInfos:currentChoices requestedType:@"glass"];
    
    NSArray *validComponents = [validAndInvalidComponents objectForKey:@"ValidComponents"];
    
    for (NSDictionary *validComponentEntry in validComponents){
        NSLog(@"VALID COMPONENTS:%@",[validComponentEntry valueForKey:@"Description"]);
    }
    
    NSArray *invalidComponents = [validAndInvalidComponents objectForKey:@"InvalidComponents"];
    
    for (NSDictionary *invalidComponentEntry in invalidComponents){
        NSLog(@"INVALID COMPONENTS:%@",[invalidComponentEntry valueForKey:@"Description"]);
    }
    
 /********
    for(DoorConfig *validComponents in [allComponents objectAtIndex:0]){
        NSLog(@"VALID: %d,%d,%d,%d,%d,%d",
              validComponents.slab,
              validComponents.color,
              validComponents.glass,
              validComponents.sidelites,
              validComponents.config,
              validComponents.jamb);
    }
    
    for(DoorConfig *invalidComponents in [allComponents objectAtIndex:1]){
        NSLog(@"INVALID %d,%d,%d,%d,%d,%d",
              invalidComponents.slab,
              invalidComponents.color,
              invalidComponents.glass,
              invalidComponents.sidelites,
              invalidComponents.config,
              invalidComponents.jamb);
    }
    *******/

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
