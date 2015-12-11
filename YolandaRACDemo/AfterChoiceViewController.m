//
//  AfterChoiceViewController.m
//  YolandaRACDemo
//
//  Created by linwenbang on 15/12/11.
//  Copyright © 2015年 yolanda. All rights reserved.
//

#import "AfterChoiceViewController.h"
#import "Masonry.h"

@interface AfterChoiceViewController ()
{
    UIButton *_popBtn;
}

@end

@implementation AfterChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //这个没啥用作用，一切简写了
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _popBtn = [[UIButton alloc] init];
    [self.view addSubview:_popBtn];
    [_popBtn setTitle:@"返回" forState:UIControlStateNormal];
    [_popBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_popBtn addTarget:self action:@selector(pop:) forControlEvents:UIControlEventTouchUpInside];
    
    [_popBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (void)pop:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
