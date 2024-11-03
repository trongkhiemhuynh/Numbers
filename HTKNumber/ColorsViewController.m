//
//  ColorsViewController.m
//  HTKNumber
//
//  Created by Khiem T. Huynh on 10/16/16.
//  Copyright © 2016 HTK. All rights reserved.
//

#import "ColorsViewController.h"

@interface ColorsViewController ()

@end

@implementation ColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Colors";
    self.btn1.layer.cornerRadius = 35.0;
    self.btn2.layer.cornerRadius = 35.0;
    self.btn3.layer.cornerRadius = 35.0;
    
    self.viewColor1.layer.cornerRadius = 35.0;
    self.viewColor2.layer.cornerRadius = 35.0;
    
    UIView *subView = [[UIView alloc] initWithFrame:self.view.frame];
    UILabel *lblMaintenance = [[UILabel alloc] initWithFrame:subView.frame];
    [subView addSubview:lblMaintenance];
    [self.view addSubview:subView];
    
    lblMaintenance.text = @"This page is in progress...";
    lblMaintenance.textAlignment = NSTextAlignmentCenter;
    subView.backgroundColor = [UIColor grayColor];
    lblMaintenance.textColor = [UIColor redColor];
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

- (IBAction)btn1Press:(id)sender {
}

- (IBAction)btn2Press:(id)sender {
}

- (IBAction)btn3Press:(id)sender {
}
@end
