//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Stepan Grigoryan on 2/17/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultPercentageControl;
+ (void) setDefaultPercentageIndex:(NSInteger)index;
@end

@implementation SettingsViewController

NSString * const indexKey = @"index";

- (IBAction)onValueChange:(id)sender {
    [[self class] setDefaultPercentageIndex:self.defaultPercentageControl.selectedSegmentIndex];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.defaultPercentageControl setSelectedSegmentIndex:[[self class] getDefaultPercentageIndex]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (NSInteger) getDefaultPercentageIndex
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    // If this is the first time and the key does not exist, it will return 0 which is what we want
    return[defaults integerForKey:indexKey];
}

+ (void) setDefaultPercentageIndex:(NSInteger)index
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:index forKey:indexKey];
    [defaults synchronize];
}

@end
