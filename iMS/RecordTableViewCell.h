//
//  RecordTableViewCell.h
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/12/21.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *clefTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end
