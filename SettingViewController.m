//  SettingViewController.m
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/11/16.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import "SettingViewController.h"
#import "EasyModeViewController.h"
#import "AdvancedModeViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    if ([self.modeType isEqualToString:NormalMode] || [self.modeType isEqualToString:AdvanceMode]) {
        [self.unLabel setText:@"題"];
        self.questionNumberLabel.text = [NSString stringWithFormat:@"%d", (int)self.slider.value];
//    }else if ([self.modeType isEqualToString:TimeMode]) {
//        [self.slider setHidden:YES];
//        self.questionNumberLabel.text = @"60";
//        [self.unLabel setText:@"秒"];
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        EasyModeViewController *destVC = [segue destinationViewController];
        destVC.clefType  = self.clefSegment.selectedSegmentIndex;
        destVC.questionNumber = (int)self.slider.value;
}



- (IBAction)sliderValueChange:(id)sender {
    self.questionNumberLabel.text = [NSString stringWithFormat:@"%d", (int)self.slider.value];
}

@end
