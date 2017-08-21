//
//  ViewController.m
//  索引
//
//  Created by 易云时代 on 2017/8/21.
//  Copyright © 2017年 笑伟. All rights reserved.
//

//
//  ViewController.m
//  UISearBar
//
//  Created by 易云时代 on 2017/8/21.
//  Copyright © 2017年 XW. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WITH     (float)(320)/(float)320*[[UIScreen mainScreen]bounds].size.width

#define SCREEN_HEIGHT     (float)(320)/(float)320*[[UIScreen mainScreen]bounds].size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arr;
    NSDictionary *_dataSource;
}
@property (nonatomic, strong) UITableView *table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WITH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    arr = [[NSMutableArray alloc]init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NameList" ofType:@"plist"];
    _dataSource = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *atttt = [_dataSource allKeys];
    atttt = [atttt sortedArrayUsingSelector:@selector(compare:)];
    arr = [atttt copy];
    [_table reloadData];
}

#pragma mark TableViewDelegateAndDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return arr[section];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pp"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pp"];
    }
    NSArray *st = [_dataSource objectForKey:arr[indexPath.section]];;
    cell.textLabel.text = st[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [_dataSource objectForKey:arr[section]];
    return array.count;
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return arr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
