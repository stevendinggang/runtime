//
//  DGUserInfoVC.m
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

#import "DGUserInfoVC.h"
#import "DGProfileUserInfoTool.h"
#import "DGUserInfoResultData.h"

@interface DGUserInfoVC ()
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UISwitch *switchOn;

@end

@implementation DGUserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_saveBtn addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [_clearBtn addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    
}

- (IBAction)changeValue:(UISwitch *)sender {
    
    DGUserInfoResultData *data = [DGProfileUserInfoTool accout];
    data.isTrue = sender.on;
    [DGProfileUserInfoTool saveUserInfor:data];
    
    if (data.isTrue == YES) {
        self.titleLabel.text = @"open";
    }else{
        self.titleLabel.text = @"close";
    }
    
}

-(void)clear{
    DGUserInfoResultData *data = [DGProfileUserInfoTool accout];
    data.name = @"";
    [DGProfileUserInfoTool saveUserInfor:data];
    self.titleLabel.text = [DGProfileUserInfoTool accout].name;
}
-(void)save{

    if (_textFiled.text.length>0) {
        DGUserInfoResultData *data = [DGProfileUserInfoTool accout];
        data.name = _textFiled.text;
        [DGProfileUserInfoTool saveUserInfor:data];
        self.titleLabel.text = [DGProfileUserInfoTool accout].name;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
