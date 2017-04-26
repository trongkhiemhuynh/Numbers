//
//  NumberViewController.h
//  HTKNumber
//
//  Created by Khiem T. Huynh on 10/13/16.
//  Copyright © 2016 HTK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblScore;
@property (strong, nonatomic) IBOutlet UILabel *lblNumber1;
@property (strong, nonatomic) IBOutlet UILabel *lblCac;
@property (strong, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UILabel *lblCountDown;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@property (strong, nonatomic) IBOutlet UIButton *btn1;
- (IBAction)btn1Press:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
- (IBAction)btn2Press:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
- (IBAction)btn3Press:(id)sender;
- (IBAction)btnNewGame:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnNewGame;

@end
