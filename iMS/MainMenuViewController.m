//
//  MainMenuViewController.m
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/11/16.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import "MainMenuViewController.h"
#import "SettingViewController.h"
@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    SettingViewController *destVC = [segue destinationViewController];
//    if ([segue.identifier isEqualToString:@"NormalMode"]) {
//        [destVC setModeType:NormalMode];
//    }else if ([segue.identifier isEqualToString:@"AdvanceMode"]) {
//        [destVC setModeType:AdvanceMode];
////    }else if ([segue.identifier isEqualToString:@"TimeMode"]) {
////        [destVC setModeType:TimeMode];
//    }
    
}


@end
