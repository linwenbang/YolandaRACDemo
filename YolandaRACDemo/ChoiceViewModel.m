//
//  ChoiceViewModel.m
//  YolandaRACDemo
//
//  Created by linwenbang on 15/12/11.
//  Copyright © 2015年 yolanda. All rights reserved.
//

#import "ReactiveCocoa.h"
#import "ChoiceViewModel.h"
#import "AfterChoiceViewController.h"

@implementation ChoiceViewModel

- (instancetype)init
{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    RACSignal *loginSignal = [RACSignal combineLatest:@[RACObserve(self, userName),RACObserve(self, password),RACObserve(self, isLoading)]
                                               reduce:^id(NSString *uName,NSString *pwd,NSNumber *isLoading){
                                                   return @(uName.length && pwd.length && ([isLoading integerValue] == NO));
                                               }];
    
    self.loginCommand = [[RACCommand alloc] initWithEnabled:loginSignal
                                                signalBlock:^RACSignal *(id input) {
                                                    return [self login];
                                                }];
}

- (RACSignal *)login
{
    NSLog(@"进行登录");
    //进行模拟网络请求
    self.isLoading = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AfterChoiceViewController *afVc = [[AfterChoiceViewController alloc] init];
        [self.navigationController pushViewController:afVc animated:YES];
        self.isLoading = NO;
    });
    
    return [RACSignal empty];
}

@end
