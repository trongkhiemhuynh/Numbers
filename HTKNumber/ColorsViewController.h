//
//  ColorsViewController.h
//  HTKNumber
//
//  Created by Khiem T. Huynh on 10/16/16.
//  Copyright © 2016 HTK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *viewColor1;
@property (strong, nonatomic) IBOutlet UIView *viewColor2;
@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;

- (IBAction)btn1Press:(id)sender;
- (IBAction)btn2Press:(id)sender;
- (IBAction)btn3Press:(id)sender;
@end
