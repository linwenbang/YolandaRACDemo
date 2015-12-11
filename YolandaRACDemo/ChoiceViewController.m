//
//  ChoiceViewController.m
//  YolandaRACDemo
//
//  Created by linwenbang on 15/12/11.
//  Copyright © 2015年 yolanda. All rights reserved.
//

#import "ChoiceViewController.h"
#import "ChoiceViewModel.h"
#import "ChoiceView.h"
#import "ReactiveCocoa.h"
#import "Masonry.h"

@interface ChoiceViewController ()

@property (nonatomic, strong) ChoiceViewModel   *viewModel;
@property (nonatomic, strong) ChoiceView        *customView;

@end

@implementation ChoiceViewController

- (instancetype)initWithViewModel:(id)viewModel customView:(UIView *)customView
{
    if (self = [super init]) {
        _viewModel = viewModel;
        _customView = (ChoiceView *)customView;
        [self.view addSubview:customView];
        
        [customView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登陆Demo";
    
    [self bindViewModel];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"ChoiceViewController");
}


- (void)bindViewModel
{
    //进行数据绑定
    RAC(_viewModel, userName) = _customView.userNameTextField.rac_textSignal;
    
    RAC(_viewModel, password) = _customView.passwordTextField.rac_textSignal;
    
    RAC(_customView.loginBtn, backgroundColor) = [RACObserve(_customView.loginBtn,enabled)
                                                  map:^(NSNumber *enableStatus) {
                                                      return [enableStatus integerValue] ? [UIColor redColor] : [UIColor grayColor];
                                                  }];
    
    _customView.loginBtn.rac_command = _viewModel.loginCommand;
    
}


@end
