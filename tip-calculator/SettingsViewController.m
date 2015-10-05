//
//  SettingsViewController.m
//  tip-calculator
//
//  Created by Matthew Williams on 9/29/15.
//  Copyright (c) 2015 MattWilliams. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (void)saveDefaultTipSettings;
- (void)loadDefaultTipSettings;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTipSegmentIndex = [defaults integerForKey:@"default_tip_segment_index"];
    [self.defaultTipControl setSelectedSegmentIndex:defaultTipSegmentIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDefautTipValueChanged:(id)sender {
    [self saveDefaultTipSettings];
}

- (void)saveDefaultTipSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"default_tip_segment_index"];
    [defaults synchronize];
}

- (void)loadDefaultTipSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"default_tip_segment_index"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
