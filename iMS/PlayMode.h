//
//  PlayMode.h
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/12/9.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioServices.h>
#define NSLocalizedString(key, comment) [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
@interface PlayMode : UIViewController<UIActionSheetDelegate, AVAudioPlayerDelegate, UIAlertViewDelegate>
@property NSInteger clefType;
@property NSDictionary *dict;
@property NSString *clefListPlistPath;
@property NSDictionary *clefDict;
@property NSString *clefCode;
@property NSArray *clefKeyArr;
@property NSString *musicFilePathName;
@property AVAudioPlayer *audioPlayer;

@property int questionNumber;
@property int correctCount;
@property int errorCount;
@property bool music;

-(void) initSound:(BOOL) answerResult andMusicTrigger:(BOOL) music;

- (void) checkClefType;

- (void) randomClefNodes:(UIImageView*)clefNodeImage;

- (void) refreshScoreLabel:(UILabel*) scoreLabel;

- (BOOL)shouldAutorotate;

-(void) createRecord;
@end
