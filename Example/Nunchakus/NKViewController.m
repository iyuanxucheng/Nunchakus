//
//  NKViewController.m
//  Nunchakus
//
//  Created by Runs on 11/28/2019.
//  Copyright (c) 2019 Runs. All rights reserved.
//

#import "NKViewController.h"
#import <Nunchakus/Nunchakus.h>

@interface NKViewController ()

@end

@implementation NKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    defer {
        NSLog(@"NKViewController: defer is ok");
    };
    NSLog(@"NKViewController: viewDidLoad exit");

    self.view.nk_left.aligned.with(self.view.superview.nk_left).priority(NKLayoutAttributePriorityHight);
    self.view.nk_right.relative.to(self.view.superview.nk_right).offset(20).priority(1000);
    self.view.nk_top.multiple.by(self.view.superview).ratio(1.2);
    self.view.nk_left.right.bottom.top.relative.to(self.view.superview);
    self.view.nk_left.right.bottom.top.relative.in(self.view.superview);
    self.view.nk_left.right.bottom.top.relative.on(self.view.superview);
    [self.view nk_make];
    
    [self.view nk_makeLayout:^(NKLayout * _Nonnull layout) {
        layout.right.aligned.with(self.view.superview).priority(NKLayoutAttributePriorityLow).stretch();
        layout.left.relative.to(self.view.superview).offset(90).stretch();
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
