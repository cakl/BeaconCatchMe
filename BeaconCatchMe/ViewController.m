//
//  ViewController.m
//  BeaconCatchMe
//
//  Created by Mario Meili on 23/09/14.
//  Copyright (c) 2014 mariomeili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myMajorLabel.text = [NSString stringWithFormat:@"Major: %@", self.majorNumber];
    self.myMinorLabel.text = [NSString stringWithFormat:@"Minor: %@", self.minorNumber];
    
    NSString *identifier = @"52495334-5696-4DAE-BEC7-98D44A30FFDB";
    
    self.meBeaconData = @{CBAdvertisementDataLocalNameKey:@"my-peripheral", CBAdvertisementDataServiceUUIDsKey:@[[CBUUID UUIDWithString:identifier]]};
    
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
    
    // Tell location manager to start monitoring for the beacon region
    
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager*)peripheral
{
    if (peripheral.state == CBPeripheralManagerStatePoweredOn)
    {
        // Update our status label
        self.statusLabel.text = @"Broadcasting!";
        
        // Start broadcasting
        [self.peripheralManager startAdvertising:self.meBeaconData];
    }
    else if (peripheral.state == CBPeripheralManagerStatePoweredOff)
    {
        // Update our status label
        self.statusLabel.text = @"Stopped!";
        
        // Bluetooth isn't on. Stop broadcasting
        [self.peripheralManager stopAdvertising];
    }
    else if (peripheral.state == CBPeripheralManagerStateUnsupported)
    {
        self.statusLabel.text = @"Unsupported!";
    }
}

- (void)startDetectingBeacons
{
    if (!self.centralManager) self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
    //detectorTimer = [NSTimer scheduledTimerWithTimeInterval:UPDATE_INTERVAL target:self selector:@selector(reportRangesToDelegates:) userInfo:nil repeats:YES];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSLog(@"UUID: %@", [peripheral identifier]);
    NSLog(@"UUID: %@", [peripheral name]);
    NSLog(@"RSSI: %d", [RSSI intValue]);
}

/*
-(void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    switch (state) {
        case CLRegionStateUnknown:
        {
            [manager stopRangingBeaconsInRegion:self.youBeaconRegion];
            break;
        }
        case CLRegionStateInside:
        {
            [manager startRangingBeaconsInRegion:self.youBeaconRegion];
            break;
        }
        case CLRegionStateOutside:
        {
            [manager stopRangingBeaconsInRegion:self.youBeaconRegion];
            break;
        default:
            break;
        }
    }
}

- (void)locationManager:(CLLocationManager*)manager didEnterRegion:(CLRegion*)region
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.locationManager startRangingBeaconsInRegion:self.youBeaconRegion];
}

-(void)locationManager:(CLLocationManager*)manager didExitRegion:(CLRegion*)region
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.locationManager stopRangingBeaconsInRegion:self.youBeaconRegion];
    self.connectionStatusLabel.text = @"No Beacon Found!";
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%d", [CLLocationManager authorizationStatus]);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void)locationManager:(CLLocationManager*)manager
       didRangeBeacons:(NSArray*)beacons
              inRegion:(CLBeaconRegion*)region
{
    // Beacon found!
    self.connectionStatusLabel.text = @"Beacon Found!";
    
    CLBeacon *foundBeacon = [beacons lastObject];
    
    // You can retrieve the beacon data from its properties
    NSString *uuid = foundBeacon.proximityUUID.UUIDString;
    self.uuidLabel.text = [NSString stringWithFormat:@"UUID: %@",uuid];
    
    NSString* proximityLabelText;
    switch (foundBeacon.proximity) {
        case CLProximityFar:
            proximityLabelText = @"Poximity: Far";
            self.proximityColorView.backgroundColor = [UIColor orangeColor];
            break;
        case CLProximityImmediate:
            proximityLabelText = @"Poximity: Immediate";
            self.proximityColorView.backgroundColor = [UIColor greenColor];
            break;
        case CLProximityNear:
            proximityLabelText = @"Poximity: Near";
            self.proximityColorView.backgroundColor = [UIColor blueColor];
            break;
        default:
            proximityLabelText = @"Poximity: Unknown";
            self.proximityColorView.backgroundColor = [UIColor redColor];
            break;
    }
    self.proximityLabel.text = proximityLabelText;
    
    NSString *major = [NSString stringWithFormat:@"Major: %@", foundBeacon.major];
    self.majorLabel.text = major;
    
    NSString *minor = [NSString stringWithFormat:@"Minor: %@", foundBeacon.minor];
    self.minorLabel.text = minor;
}
 */



@end
