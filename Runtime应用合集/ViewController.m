//
//  ViewController.m
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

#import "ViewController.h"
#import "DGUserInfoVC.h"
#import "ButtonViewController.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSMutableArray *titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
}

-(void)setup{
    self.edgesForExtendedLayout = UIRectEdgeNone; //默认布局从导航栏下开始
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    tableView.dataSource =self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
   
    
    self.tableView = tableView;
    self.tableView.tableFooterView = [[UIView alloc] init];//空白处理
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//线隐藏
    self.tableView.backgroundColor = [UIColor grayColor];
    
    //添加线的
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    self.tableView.showsHorizontalScrollIndicator = NO; //隐藏下滑
    self.tableView.showsVerticalScrollIndicator = NO; //隐藏条
    //空白页面加载


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.titleArray[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    
//    cell.textLabel.text = [NSString stringWithString:[@"第%@行",indexPath]];
    //无选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    switch (indexPath.row) {
        case 0:{
            
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            DGUserInfoVC *userInfo = [sb instantiateViewControllerWithIdentifier:@"DGUserInfoVC"];
            [self.navigationController pushViewController:userInfo animated:NO];
            break;
        }
        case 1:{
            ButtonViewController * buttonVC = [[ButtonViewController alloc]init];
            [self.navigationController pushViewController:buttonVC animated:YES];
            break;
        }
        case 2:{
            
            break;
        }
        case 3:{
            
            break;
        }
        default:
            break;
    }
    
}



#pragma mark-懒加载
- (NSMutableArray *)titleArray{
    if (_titleArray==nil) {
        _titleArray=[NSMutableArray arrayWithArray:@[@"runtime自动归档解档",@"runtime UIButton添加属性,交换(重写)方法",@"runtime交换方法",@"runtime添加方法"]];
    }
    return _titleArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
