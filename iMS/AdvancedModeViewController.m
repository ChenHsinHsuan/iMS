//
//  AdvancedModeViewController.m
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/11/16.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import "AdvancedModeViewController.h"
#import "EasyModeViewController.h"
@interface AdvancedModeViewController ()
@end

@implementation AdvancedModeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.contentView.frame.size.height);
    self.scrollView.contentOffset = CGPointMake(696, 0);
    
    
    self.clefListPlistPath = [[NSBundle mainBundle] pathForResource:@"clefList" ofType:@"plist"];
    self.dict = [NSDictionary dictionaryWithContentsOfFile:self.clefListPlistPath];
    
    if (self.clefNodeImage == nil) {
        [self checkClefType];
        [self randomClefNodes:self.clefNodeImage];
    }
    [self refreshScoreLabel:self.scoreLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

//- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        EasyModeViewController *theEasyModeViewController = [storyboard instantiateViewControllerWithIdentifier:@"EasyMode"];
//        [theEasyModeViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
//        theEasyModeViewController.questionNumber = self.questionNumber;
//        theEasyModeViewController.clefType = self.clefType;
//        theEasyModeViewController.correctCount = self.correctCount;
//        theEasyModeViewController.errorCount = self.errorCount;
//        theEasyModeViewController.clefNodeImage = self.clefNodeImage;
//        [self presentViewController:theEasyModeViewController animated:YES completion:nil];
//    }
//    
//    // Code to update subview layout goes here
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
