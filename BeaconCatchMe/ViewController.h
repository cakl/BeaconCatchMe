//
//  ViewController.h
//  BeaconCatchMe
//
//  Created by Mario Meili on 23/09/14.
//  Copyright (c) 2014 mariomeili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, CBPeripheralManagerDelegate>

@property (strong, nonatomic) CLBeaconRegion *youBeaconRegion;
@property (strong, nonatomic) CLBeaconRegion *meBeaconRegion;
@property (strong, nonatomic) NSDictionary *meBeaconData;

@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UILabel *connectionStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *uuidLabel;
@property (weak, nonatomic) IBOutlet UILabel *proximityLabel;
@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (weak, nonatomic) IBOutlet UILabel *minorLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *myMajorLabel;
@property (weak, nonatomic) IBOutlet UILabel *myMinorLabel;

@property (strong, nonatomic) NSNumber *majorNumber;
@property (strong, nonatomic) NSNumber *minorNumber;

@property (weak, nonatomic) IBOutlet UIView *proximityColorView;


@end

