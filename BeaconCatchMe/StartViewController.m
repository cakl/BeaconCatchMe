//
//  StartViewController.m
//  BeaconCatchMe
//
//  Created by Mario Meili on 23/09/14.
//  Copyright (c) 2014 mariomeili. All rights reserved.
//

#import "StartViewController.h"
#import "ViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"BROADCAST"])
    {
        // Get reference to the destination view controller
        ViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber * majorNumber = [f numberFromString:self.majorTextField.text];
        NSNumber * minorNumber = [f numberFromString:self.minorTextField.text];
        
        vc.majorNumber = majorNumber;
        vc.minorNumber = minorNumber;
    }
}

- (IBAction)buttonClicked:(id)sender {
    
}

@end
