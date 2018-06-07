//
//  ButtonViewController.m
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

#import "ButtonViewController.h"
//#import "UIButton+Ignore.h"


@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUp];
}

-(void)setUp{

    UIButton * addButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    
    addButton.backgroundColor = [UIColor redColor];
    
    [addButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
//    addButton.isOpen = YES;
    [self.view addSubview:addButton];
    
    
    UIButton * OkButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 180, 200, 50)];
    OkButton.backgroundColor = [UIColor greenColor];
    [OkButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    OkButton.isOpen = NO;
    [self.view addSubview:OkButton];
    
}

-(void)click{
    
    NSLog(@"123");
}



@end
