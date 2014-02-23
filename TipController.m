//
//  TipCalcualtorViewController.m
//  TipCalculator
//
//  Created by Stepan Grigoryan on 2/17/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import "TipController.h"
#import "SettingsViewController.h"

@interface TipController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void) onSettingsButton;
@end

@implementation TipController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"Tip Calculator"];
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tipControl setSelectedSegmentIndex:[SettingsViewController getDefaultPercentageIndex]];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTap:(id)sender
{
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues
{
    float billAmount = [self.billAmountTextField.text floatValue];
    NSArray *tips = @[@(0.1), @(.15), @(0.2)];
    float tipAmmount = [tips[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float total = billAmount + tipAmmount;
    [self.tipLabel setText:[[NSString alloc] initWithFormat:@"$%0.2f", tipAmmount]];
    [self.totalLabel setText:[[NSString alloc] initWithFormat:@"$%0.2f", total]];
}

- (void)onSettingsButton
{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
