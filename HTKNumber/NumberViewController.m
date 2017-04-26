//
//  NumberViewController.m
//  HTKNumber
//
//  Created by Khiem T. Huynh on 10/13/16.
//  Copyright © 2016 HTK. All rights reserved.
//

#import "NumberViewController.h"

@interface NumberViewController () {
    int t;
    int randBtn;
    int countScore;
    NSTimer *t1;
}

/*- (void)timeCount:(NSTimer *)timer;*/

@end

@implementation NumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Numbers";
    self.lblStatus.text = @"";
    [self initNumber];
    
//    [self.btn1 setTitle:[NSString stringWithFormat:@"%d",num3] forState:UIControlStateNormal];
//    [self.btn2 setTitle:[NSString stringWithFormat:@"%d",num3+1] forState:UIControlStateNormal];
//    [self.btn3 setTitle:[NSString stringWithFormat:@"%d",num3+2] forState:UIControlStateNormal];
    
    
//    Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(TimerCount) userInfo:nil repeats:YES];
    // tao ham ramdom so 1 va ket qua 0 -> 99
//    set gia tri vao so 1 va ket qua
    // so thu 2 = ket qua +/- so thu 1
//    gan gia tri so thu 2 vao button press
//    
//    neu dung tang diem len 1
//    sai --> game over
// Dung NSUserDefault de luu lai so diem
}

- (void)initNumber {
    [self.btnNewGame setUserInteractionEnabled:NO];
    [self.btn1 setUserInteractionEnabled:YES];
    [self.btn2 setUserInteractionEnabled:YES];
    [self.btn3 setUserInteractionEnabled:YES];
    self.btn2.backgroundColor = [UIColor lightGrayColor];
    self.btn1.backgroundColor = [UIColor lightGrayColor];
    self.btn3.backgroundColor = [UIColor lightGrayColor];
    
    int numRand1 = arc4random()%100;
    
    int numRand2 = arc4random()%100;
    
    int num3 = numRand2 - numRand1; // ket qua dung;
    
    if (num3 < 0) {
        self.lblCac.text = @"-";
        num3 *= -1;
    } else {
        self.lblCac.text = @"+";
    }
    
    randBtn = [self randBtn];
    
    switch (randBtn) {
        case 1:
            [self.btn1 setTitle:[NSString stringWithFormat:@"%d",num3] forState:UIControlStateNormal];
            [self.btn2 setTitle:[NSString stringWithFormat:@"%d",num3+1] forState:UIControlStateNormal];
            [self.btn3 setTitle:[NSString stringWithFormat:@"%d",num3+2] forState:UIControlStateNormal];
            break;
        case 2:
            [self.btn1 setTitle:[NSString stringWithFormat:@"%d",num3 - 1] forState:UIControlStateNormal];
            [self.btn2 setTitle:[NSString stringWithFormat:@"%d",num3] forState:UIControlStateNormal];
            [self.btn3 setTitle:[NSString stringWithFormat:@"%d",num3 + 1] forState:UIControlStateNormal];
            break;
            
        case 3:
            [self.btn1 setTitle:[NSString stringWithFormat:@"%d",num3 - 2] forState:UIControlStateNormal];
            [self.btn2 setTitle:[NSString stringWithFormat:@"%d",num3 - 1] forState:UIControlStateNormal];
            [self.btn3 setTitle:[NSString stringWithFormat:@"%d",num3] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    self.lblNumber1.text = [NSString stringWithFormat:@"%d",numRand1];
    self.lblResult.text = [NSString stringWithFormat:@"%d",numRand2];
    
    t = 3;
//    [t1 fire];
//    t1 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timeCount) userInfo:nil repeats:YES];
    self.lblCountDown.text = [NSString stringWithFormat:@"%d",t];
    t1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCount) userInfo:nil repeats:YES];
//    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//    [runLoop addTimer:t1 forMode:NSDefaultRunLoopMode];
    
}

- (void)timeCount/*:(NSTimer *)timer*/ {
    t--;
   self.lblCountDown.text = [NSString stringWithFormat:@"%d",t];
    
    if (t == 2) {
        switch (randBtn) {
            case 1:
                if (self.btn1.tag == 1) {
                    [self setScore:3];
                    [self resetStatus];
                    [self initNumber];
                    return;
                }
                break;
            case 2:
                if (self.btn2.tag == 1) {
                    [self setScore:3];
                    [self resetStatus];
                    [self initNumber];
                    return;
                }
                break;
            case 3:
                if (self.btn3.tag == 1) {
                    [self setScore:3];
                    [self resetStatus];
                    [self initNumber];
                    return;
                }
                break;
            default:
                break;
        }
    }
    
    if (t == 1) {
        switch (randBtn) {
            case 1:
                if (self.btn1.tag == 1) {
                    [self setScore:2];
                    [self resetStatus];
                    [self initNumber];
                    return;
                }
                break;
            case 2:
                if (self.btn2.tag == 1) {
                    [self setScore:2];
                    [self resetStatus];
                    [self initNumber];
                    return;
                }
                break;
            case 3:
                if (self.btn3.tag == 1) {
                    [self setScore:2];
                    [self resetStatus];
                    [self initNumber];
                    return;
                }
                break;
            default:
                break;
        }
    }
    
    if (t == 0) {
        switch (randBtn) {
            case 1:
                if (self.btn1.tag == 1) {
                    [self setScore:1];
                    [self resetStatus];
                    [self initNumber];
                } else {
                    self.lblStatus.text = @"GAME OVER";
                }
                break;
            case 2:
                if (self.btn2.tag == 1) {
                    [self setScore:1];
                    [self resetStatus];
                    [self initNumber];
                } else {
                    self.lblStatus.text = @"GAME OVER";
                }
                break;
            case 3:
                if (self.btn3.tag == 1) {
                    [self setScore:1];
                    [self resetStatus];
                    [self initNumber];
                } else {
                    self.lblStatus.text = @"GAME OVER";
                }
                break;
            default:
                break;
        }
        
        if ([self.lblStatus.text isEqualToString:@"GAME OVER"]) {
            [self.btnNewGame setUserInteractionEnabled:YES];
            [self.btn1 setUserInteractionEnabled:NO];
            [self.btn2 setUserInteractionEnabled:NO];
            [self.btn3 setUserInteractionEnabled:NO];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *strScore = [defaults objectForKey:@"highest"];
            
            if (strScore != nil) {
                int iScore = [strScore intValue];
                if (iScore < countScore) {
                    [defaults setObject:[NSString stringWithFormat:@"%d",countScore] forKey:@"highest"];
                    [defaults synchronize];
                }
            } else {
                [defaults setObject:[NSString stringWithFormat:@"%d",countScore] forKey:@"highest"];
                [defaults synchronize];
            }
            
            [self resetStatus];
        }
    }
    
}

- (void)setScore:(int)score {
    countScore += score;
    self.lblScore.text = [NSString stringWithFormat:@"Your score: %d",countScore];
    if (score == 3) {
        self.lblStatus.text = @"EXCELLENT";
    } else if (score == 2){
        self.lblStatus.text = @"PERFECT";
    } else {
        self.lblStatus.text = @"GOOD";
    }
}

- (void)resetStatus {
    [t1 invalidate];
    t1 = nil;
    
    self.btn1.tag = 0;
    self.btn2.tag = 0;
    self.btn3.tag = 0;
}

- (int)randBtn {
    int num = arc4random()%3 + 1;
    return num;
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
    self.btn1.backgroundColor = [UIColor redColor];
    self.btn2.backgroundColor = [UIColor lightGrayColor];
    self.btn3.backgroundColor = [UIColor lightGrayColor];
    self.btn1.tag = 1;
    self.btn2.tag = 0;
    self.btn3.tag = 0;
}

- (IBAction)btn2Press:(id)sender {
    self.btn2.backgroundColor = [UIColor redColor];
    self.btn1.backgroundColor = [UIColor lightGrayColor];
    self.btn3.backgroundColor = [UIColor lightGrayColor];
    self.btn1.tag = 0;
    self.btn2.tag = 1;
    self.btn3.tag = 0;
}

- (IBAction)btn3Press:(id)sender {
    self.btn3.backgroundColor = [UIColor redColor];
    self.btn2.backgroundColor = [UIColor lightGrayColor];
    self.btn1.backgroundColor = [UIColor lightGrayColor];
    self.btn1.tag = 0;
    self.btn2.tag = 0;
    self.btn3.tag = 1;
}

- (IBAction)btnNewGame:(id)sender {
    countScore = 0;
    self.lblStatus.text = @"";
    self.lblScore.text = @"Your score: 0";
    [self initNumber];
}


@end
