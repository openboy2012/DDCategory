//
//  DDDemoViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/3.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDDemoViewController.h"
#import "DDCategory.h"
#import <AVFoundation/AVFoundation.h>
#import "DDTestPageViewController.h"
#import "MJRefresh.h"

@interface DDDemoViewController ()<UISearchControllerDelegate, UISearchBarDelegate>

@property (nonatomic, strong, nullable) NSMutableArray<NSString *> *itemsArray;
@property (nonatomic, weak) UIViewController *lastViewController;

@end

@implementation DDDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
//    self.tableView.tableHeaderView = searchBar;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if (!_itemsArray)
    {
        _itemsArray = [NSMutableArray new];
    }
    [_itemsArray removeAllObjects];
    [_itemsArray addObject:@"MRC"];
    [_itemsArray addObject:@"ARC"];
    [_itemsArray addObject:@"Block"];
    [_itemsArray addObject:@"Bridge&Copying"];
    [_itemsArray addObject:@"Video Orientation"];
    
    NSLog(@"this iPhone is jailbreak? %d", [[self class] isBreakOutPrison]);
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"刷新");
        sleep(2);
        [self.tableView.mj_header endRefreshing];
    }];
//    [self.tableView.mj_header beginRefreshing];
}

// 常见越狱文件
const char *examineBreak_Tool_pathes[] = {
    "/Applications/Cydia.app",
    "/Library/MobileSubstrate/MobileSubstrate.dylib",
    "/bin/bash",
    "/usr/sbin/sshd",
    "/etc/apt"
};
char *printEnv(void)
{
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    return env;
    
}

+ (BOOL)isBreakOutPrison
{
    // 方式1.判断是否存在越狱文件
    for (int i = 0; i < 5; i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:examineBreak_Tool_pathes[0]]])
        {
            return YES;
        }
    }
    // 方式2.判断是否存在cydia应用
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]){
        return YES;
    }
    // 方式3.读取系统所有的应用名称
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Applications/"]){
        return YES;
    }
    // 方式4.读取环境变量
    if(printEnv()){
        return YES;
    }
    return NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DDNotificationTests" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DDKitCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_itemsArray dd_objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"MRCSegue" sender:nil];
    } else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"ARCSegue" sender:nil];
    } else if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"BlockSegue" sender:nil];
    } else if (indexPath.row == 3) {
        self.lastViewController = nil;
        [self performSegueWithIdentifier:@"BridgeSegue" sender:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DDNotificationTests" object:nil];
    } else if (indexPath.row == 4) {
        [self performSegueWithIdentifier:@"OrientationSegue" sender:nil];
        
//        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        [self.navigationController.tabBarController presentViewController:board.instantiateInitialViewController animated:YES completion:NULL];
        
//        DDTestPageViewController *vc = [[DDTestPageViewController alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
    }
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.view.bounds.size.height, rand()%2 == 0?100.0f: 50.0f);
//}

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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController *vc = segue.destinationViewController;
    vc.hidesBottomBarWhenPushed = YES;
    self.lastViewController = vc;
}

@end
