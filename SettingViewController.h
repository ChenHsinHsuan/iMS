//
//  SettingViewController.h
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/11/16.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NormalMode @"N"
#define AdvanceMode @"A"
#define TimeMode @"T"
@interface SettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *clefSegment;
@property (weak, nonatomic) IBOutlet UILabel *questionNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *unLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic) NSString *modeType;
@end
