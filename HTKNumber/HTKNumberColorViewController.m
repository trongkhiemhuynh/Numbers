//
//  ViewController.m
//  HTKNumber
//
//  Created by Khiem T. Huynh on 10/13/16.
//  Copyright © 2016 HTK. All rights reserved.
//

#import "HTKNumberColorViewController.h"

@interface HTKNumberColorViewController ()

@end

@implementation HTKNumberColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Numbers & Colors";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *scoreHighest = [defaults objectForKey:@"highest"];
    
    if (scoreHighest != nil) {
        self.lblScoreHighest.text = [NSString stringWithFormat:@"Your highest score: %@",scoreHighest];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *scoreHighest = [defaults objectForKey:@"highest"];
    
    if (scoreHighest != nil) {
        self.lblScoreHighest.text = [NSString stringWithFormat:@"Your highest score: %@",scoreHighest];;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
