//
//  EasyModeViewController.m
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/11/16.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import "EasyModeViewController.h"
#import "AdvancedModeViewController.h"

#import "SettingViewController.h"
@interface EasyModeViewController ()
@property NSDictionary *specailClefDict;
@end

@implementation EasyModeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clefListPlistPath = [[NSBundle mainBundle] pathForResource:@"clefList" ofType:@"plist"];
    self.dict = [NSDictionary dictionaryWithContentsOfFile:self.clefListPlistPath];
    
    NSArray *keyArr = @[@"F13G1",@"F14G2",@"F15G3",@"F16G4",@"F17G5",@"F18G6"];
    NSArray *objectArr =@[@"G1F13",@"G2F14",@"G3F15",@"G4F16",@"G5F17",@"G6F18"];
    _specailClefDict = [[NSDictionary alloc]initWithObjects:objectArr forKeys:keyArr];

    [self checkClefType];
    [self randomClefNodes:self.clefNodeImage];
    
    [self refreshScoreLabel:self.scoreLabel];
    
    self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.contentView.frame.size.height);
    self.scrollView.contentOffset = CGPointMake(696, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)keyboardPressed:(UIButton*)sender
{
    NSString *pressAnswer = [NSString stringWithFormat:@"%ld",(long)[sender tag]];
    //G1~G6(F13~F18)特殊按鈕檢查
    if ([_specailClefDict objectForKey:sender.titleLabel.text] != nil) {
        if([self.clefCode isEqual:[_specailClefDict objectForKey:sender.titleLabel.text]]  || [self.clefCode isEqualToString: sender.titleLabel.text]){
            //答對
            [self doCorrectAnswer];
        }else{
            //答錯
        [self doWrongAnswer];
        }
    }else if ([[self.clefDict objectForKey:self.clefCode] isEqualToString: pressAnswer] || [self.clefCode isEqualToString: sender.titleLabel.text]) {
        //答對
        [self doCorrectAnswer];
    }else{
        //答錯
        [self doWrongAnswer];
    }

    [self refreshScoreLabel:self.scoreLabel];
}

- (void) doCorrectAnswer
{
    [self initSound:YES andMusicTrigger:self.music];
    self.correctCount++;
    [self randomClefNodes:self.clefNodeImage];
}

- (void) doWrongAnswer
{
    self.errorCount++;
    [self initSound:NO andMusicTrigger:self.music];
}

- (IBAction)menuButtonPressed:(id)sender
{
    NSString *triggerString;
    if (self.music) {
        triggerString = @"關";
    }else{
        triggerString = @"開";
    }
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"功能選單"
                                                             delegate:self
                                                    cancelButtonTitle:@"繼續練習"
                                               destructiveButtonTitle:[NSString stringWithFormat:@"[%@]音效", triggerString]
                                                   otherButtonTitles:@"重新開始",@"結束練習", nil];
    //將actionSheet顯示於畫面上
    [actionSheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"index:%ld", (long)buttonIndex);
    switch (buttonIndex){
        case 0:
            self.music = !self.music;
            break;
        case 1:
            self.correctCount = 0;
            self.errorCount = 0;
            [self randomClefNodes:self.clefNodeImage];
            [self refreshScoreLabel:self.scoreLabel];
            break;
        case 2:
        {
            [self.presentingViewController dismissViewControllerAnimated:YES
                                                              completion:^{
                                                                  self.correctCount = 0;
                                                                  self.errorCount = 0;
                                                              }];
            break;
        }
        case 3:
            break;
        default:

            break;

    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex:%ld", (long)buttonIndex);
    [self createRecord];
    switch (buttonIndex) {
        case 0:
            self.correctCount = 0;
            self.errorCount = 0;
            
            [self randomClefNodes:self.clefNodeImage];
            [self refreshScoreLabel:self.scoreLabel];
            break;
        case 1:
        {
            [self.presentingViewController dismissViewControllerAnimated:YES
                                                              completion:^{
                                                                  self.correctCount = 0;
                                                                  self.errorCount = 0;
                                                              }];
            break;
        }
        default:
            break;
    }
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

