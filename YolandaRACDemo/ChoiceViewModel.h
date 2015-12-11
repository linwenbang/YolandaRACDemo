//
//  ChoiceViewModel.h
//  YolandaRACDemo
//
//  Created by linwenbang on 15/12/11.
//  Copyright © 2015年 yolanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"

@interface ChoiceViewModel : NSObject
@property (nonatomic, weak) UINavigationController *navigationController;

@property (nonatomic, assign) BOOL isLoading;//用来假设网络请求状态

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) RACCommand *loginCommand;
@end
