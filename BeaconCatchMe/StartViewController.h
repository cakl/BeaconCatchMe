//
//  StartViewController.h
//  BeaconCatchMe
//
//  Created by Mario Meili on 23/09/14.
//  Copyright (c) 2014 mariomeili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface StartViewController : UIViewController <CBPeripheralManagerDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *majorTextField;
@property (weak, nonatomic) IBOutlet UITextField *minorTextField;

@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) NSDictionary *myBeaconData;

@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@end
