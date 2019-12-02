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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
