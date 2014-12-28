//
//  RecordTableViewController.m
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/12/21.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import "RecordTableViewController.h"
#import "RecordTableViewCell.h"
@interface RecordTableViewController ()
@property NSDictionary* recordDic;
@end

@implementation RecordTableViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"recordList.plist"];
    
    // 從 plist 檔案讀出
    _recordDic = [NSDictionary dictionaryWithContentsOfFile: plistPath];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString*)convertClefType: (NSString*) clefType
{
    
    NSString *returnString;
    if([clefType isEqualToString:@"0"]) {
        returnString = @"F";
    }else if ([clefType isEqualToString:@"1"]){
        returnString = @"Mix";
    }else if ([clefType isEqualToString:@"2"]){
        returnString = @"G";
    }
    return returnString;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_recordDic allKeys]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordTableViewCell *cell;
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"RecordCell" forIndexPath:indexPath];
    }
    
    NSString * key = [[_recordDic allKeys] objectAtIndex:indexPath.row];
    NSDictionary *innerDict = [_recordDic objectForKey: key];
    
    cell.clefTypeLabel.text = [self convertClefType:[innerDict objectForKey:@"clefType"]];
    cell.scoreLabel.text = [innerDict objectForKey:@"score"];
    cell.correctLabel.text = [NSString stringWithFormat:@"⭕️%@",[innerDict objectForKey:@"correctCount"]];
    cell.errorLabel.text = [NSString stringWithFormat:@"❌%@", [innerDict objectForKey:@"errorCount"]];
    cell.timeLabel.text = key;

    
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
