//
//  ChoiceView.m
//  YolandaRACDemo
//
//  Created by linwenbang on 15/12/11.
//  Copyright © 2015年 yolanda. All rights reserved.
//

#import "ChoiceView.h"
#import "Masonry.h"
#import "ReactiveCocoa.h"


@interface  ChoiceView()
{
    
}

@end

@implementation ChoiceView

- (instancetype)init
{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

//初始化控件
- (void)initialize
{
    self.backgroundColor = [UIColor whiteColor];
    self.userNameTextField = [[UITextField alloc] init];
    self.userNameTextField.layer.borderColor = [UIColor grayColor].CGColor;
    self.userNameTextField.layer.borderWidth = 1;
    [self addSubview:self.userNameTextField];
    
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.layer.borderColor = [UIColor grayColor].CGColor;
    self.passwordTextField.layer.borderWidth = 1;
    [self.passwordTextField setSecureTextEntry:YES];
    [self addSubview:self.passwordTextField];
    
    self.loginBtn = [[UIButton alloc] init];
    [self addSubview:self.loginBtn];
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor redColor];
}


//如果外部没有需要去修改控件，则将位置设置方法放在这里
//想了解layoutSubviews具体调用方法可以，看我blog中 http://www.jianshu.com/p/139fbf801220 的解释
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    @weakify(self);
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.center.equalTo(self);
        make.height.mas_equalTo(50);
        make.width.equalTo(self).offset(-40);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.userNameTextField);
        make.size.equalTo(self.userNameTextField);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.userNameTextField);
        make.size.equalTo(self.userNameTextField);
    }];
    
}

@end
