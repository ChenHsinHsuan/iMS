//
//  PlayMode.m
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/12/9.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import "PlayMode.h"

@interface PlayMode ()

@end

@implementation PlayMode

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotate {
    return YES;
}

#pragma mark- 辨別USER想要練習的譜號
- (void) checkClefType
{
    switch (self.clefType) {
        case 0:
            self.clefDict = [self.dict objectForKey:@"F"];
            break;
        case 1:
            self.clefDict = [self.dict objectForKey:@"GF"];
            break;
        case 2:
            self.clefDict = [self.dict objectForKey:@"G"];
            break;
        default:
            break;
    }
    self.clefKeyArr = [self.clefDict allKeys];
}


#pragma mark- 隨機出題
- (void) randomClefNodes:(UIImageView*)clefNodeImage
{
    int randomNum;
    do{
       randomNum =arc4random()%[self.clefDict count];
    }while ([self.clefCode isEqualToString:[self.clefKeyArr objectAtIndex:randomNum]]);
    
    self.clefCode = [self.clefKeyArr objectAtIndex:randomNum];
    [clefNodeImage setImage:[UIImage imageNamed:self.clefCode]];
}


#pragma mark- 更新分數
- (void) refreshScoreLabel:(UILabel*) scoreLabel;
{
    
    scoreLabel.text = [NSString stringWithFormat:@"⭕️x%d ❌x%d",self.correctCount, self.errorCount];
    if (self.questionNumber <= self.correctCount+self.errorCount) {
        UIAlertView *alertVIew = [[UIAlertView alloc]initWithTitle:@"成績單"
                                                           message:[NSString stringWithFormat:@"%d 分", (self.correctCount*100/self.questionNumber)]
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"再次練習", @"結束練習", nil];
        [alertVIew show];
    }
}


#pragma mark- 答錯音效處理
-(void) initSound:(BOOL) answerResult andMusicTrigger:(BOOL) music {
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);//震動
    if (!music) {
        return;
    }
    if (answerResult) {
        self.musicFilePathName = [[NSBundle mainBundle] pathForResource:@"correct" ofType:@"mp3"];
    }else{
        self.musicFilePathName = [[NSBundle mainBundle] pathForResource:@"wrong" ofType:@"mp3"];
    }
    if(self.musicFilePathName != nil){
        NSURL *url =[NSURL fileURLWithPath:self.musicFilePathName];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.audioPlayer.numberOfLoops = 0;
        [self.audioPlayer prepareToPlay];
    }else{
        NSLog(@"Load Sound is fail!");
    }
    [self.audioPlayer play];
}


-(void) createRecord
{
    
    NSDateFormatter *formatter;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    
    
    NSDictionary *innerDataDict = [[NSDictionary alloc]initWithObjectsAndKeys:
                                   [NSString stringWithFormat:@"%ld",(long)self.clefType], @"clefType",
                                   [NSString stringWithFormat:@"%d",self.questionNumber],@"questionCount",
                                   [NSString stringWithFormat:@"%d",self.correctCount],@"correctCount",
                                   [NSString stringWithFormat:@"%d",self.errorCount],@"errorCount",
                                   [NSString stringWithFormat:@"%d",(self.correctCount*100/self.questionNumber)],@"score",
                                   nil];
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"recordList.plist"];
    NSLog(@"plistPath:%@",plistPath);

    NSMutableDictionary *dataDict;
    if(plistPath != nil){
        dataDict = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
        [dataDict setObject:innerDataDict forKey:dateString];
    }else{
        dataDict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:innerDataDict, dateString,nil];
    }
    
    // 寫入 plist 檔案
    if ([dataDict writeToFile:plistPath atomically:YES] == YES) {
        NSLog(@"成功寫入 dic");
    }
}


@end
