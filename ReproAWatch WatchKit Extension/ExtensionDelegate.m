//
//  ExtensionDelegate.m
//  ReproAWatch WatchKit Extension
//
//  Created by Ronan JANVRESSE on 07/10/2015.
//  Copyright © 2015 Ronan JANVRESSE. All rights reserved.
//

#import "ExtensionDelegate.h"
#import <HealthKit/HealthKit.h>

@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching {
    // Perform any final initialization of your application.
    NSLog(@"test");
    HKHealthStore* healstore=[HKHealthStore new];
    NSSet* readobject = [NSSet setWithObjects:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate],[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],nil];
    NSSet* shareobject = [NSSet setWithObjects:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass], nil];
    
    [healstore requestAuthorizationToShareTypes:shareobject readTypes:readobject completion:^(BOOL success, NSError *error) {
        
        if(success == YES)
        {
            NSLog(@"OK");
            
            HKQuantityType* heartratetype = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
            /*HKWorkout* workout= [[HKWorkoutSession alloc]initWithActivityType:HKWorkoutActivityTypeCrossTraining locationType:HKWorkoutSessionLocationTypeUnknown];
            NSPredicate* prediction = [HKQuery predicateForSamplesWithStartDate:[NSDate date] endDate:nil options:HKQueryOptionNone];
            HKAnchoredObjectQuery* query = [[HKAnchoredObjectQuery alloc]initWithType:heartratetype predicate:prediction anchor:nil limit:5 resultsHandler:^(HKAnchoredObjectQuery* query, nil,nil,nil,NSError* error) {
                
             }];*/
            
        }
        else{
            NSLog(@"%@",error);
        }
    }];
}

- (void)applicationDidBecomeActive {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillResignActive {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, etc.
}

@end
