//
//  ViewController.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/1.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "ViewController.h"
#import "T8HudHelper.h"
#import "T8CameraHelper.h"
#import "NSString+T8.h"
#import "T8UserDefaultHelper.h"
#import "TestMenuViewController.h"

@interface ViewController ()

@property (nonatomic) UIButton *testButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testButton.frame = CGRectMake(100, 100, 100, 100);
    self.testButton.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.testButton];
    
    NSLog(@"%@", [@"zhang" MD5]);

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)testButton
{
    if (!_testButton) {
        _testButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_testButton addTarget:self action:@selector(testButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testButton;
}

- (void)testButtonPressed
{
    TestMenuViewController *menu = [[TestMenuViewController alloc] init];
    [self.navigationController pushViewController:menu animated:YES];
}

@end
