//
//  NumberViewController.m
//  HTKNumber
//
//  Created by Khiem T. Huynh on 10/13/16.
//  Copyright © 2016 HTK. All rights reserved.
//

#import "NumberViewController.h"

const int TIME_LIMIT = 7;

@interface NumberViewController () {
    int timeLimit;
    int randomPositionResultValue;
    int countScore;
    NSTimer *timer;
    
    int numRand1;
    int numRand2;
    int num3;
}

/*- (void)timeCount:(NSTimer *)timer;*/

@end

@implementation NumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Numbers";
    self.lblStatus.text = @"";
    [self initNumber];
    
}

- (void)initNumber {
    [self.btnNewGame setUserInteractionEnabled:NO];
    
    [self.btn1 setUserInteractionEnabled:YES];
    [self.btn2 setUserInteractionEnabled:YES];
    [self.btn3 setUserInteractionEnabled:YES];
    
    self.btn2.backgroundColor = [UIColor lightGrayColor];
    self.btn1.backgroundColor = [UIColor lightGrayColor];
    self.btn3.backgroundColor = [UIColor lightGrayColor];
    
    /* random number */
    numRand1 = arc4random()%100;
    
    numRand2 = arc4random()%100;
    
    num3 = numRand2 - numRand1; // ket qua dung;
    
    /* end random number */
    
    // MARK: - extend for multiple and divide?
    if (num3 < 0) {
        self.lblCac.text = @"-";
        num3 *= -1;
    } else {
        self.lblCac.text = @"+";
    }
    
    // MARK: - random button choose
    randomPositionResultValue = [self randomNumber:3];
    
    switch (randomPositionResultValue) {
        case 1:
            [self.btn1 setTitle:[NSString stringWithFormat:@"%d",num3] forState:UIControlStateNormal];
            [self.btn2 setTitle:[NSString stringWithFormat:@"%d",num3 + [self randomNumber:100]] forState:UIControlStateNormal];
            [self.btn3 setTitle:[NSString stringWithFormat:@"%d",num3 + [self randomNumber:100]] forState:UIControlStateNormal];
            break;
        case 2:
            [self.btn1 setTitle:[NSString stringWithFormat:@"%d",num3 - [self randomNumber:100]] forState:UIControlStateNormal];
            [self.btn2 setTitle:[NSString stringWithFormat:@"%d",num3] forState:UIControlStateNormal];
            [self.btn3 setTitle:[NSString stringWithFormat:@"%d",num3 + [self randomNumber:100]] forState:UIControlStateNormal];
            break;
            
        case 3:
            [self.btn1 setTitle:[NSString stringWithFormat:@"%d",num3 - [self randomNumber:100]] forState:UIControlStateNormal];
            [self.btn2 setTitle:[NSString stringWithFormat:@"%d",num3 - [self randomNumber:100]] forState:UIControlStateNormal];
            [self.btn3 setTitle:[NSString stringWithFormat:@"%d",num3] forState:UIControlStateNormal];
            break;
            
        default:
//            break;
            [self.btn1 setTitle:[NSString stringWithFormat:@"%d",num3] forState:UIControlStateNormal];
            [self.btn2 setTitle:[NSString stringWithFormat:@"%d",num3+[self randomNumber:100]] forState:UIControlStateNormal];
            [self.btn3 setTitle:[NSString stringWithFormat:@"%d",num3+[self randomNumber:100]] forState:UIControlStateNormal];
    }
    
    self.lblNumber1.text = [NSString stringWithFormat:@"%d",numRand1];
    self.lblResult.text = [NSString stringWithFormat:@"%d",numRand2];
    
    // random button choose
    
    timeLimit = TIME_LIMIT;
    
    self.lblCountDown.text = [NSString stringWithFormat:@"%d",timeLimit];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCount) userInfo:nil repeats:YES];
    
}

- (BOOL)checkAnswer:(NSInteger)positionCorrect {
    
    if (self.btn1.tag > 0 || self.btn2.tag > 0 || self.btn3.tag > 0) {
        
        if (positionCorrect == self.btn1.tag || positionCorrect == self.btn2.tag || positionCorrect == self.btn3.tag ) {
            
            return TRUE;
            
        } else {
            
            return FALSE;
            
        }
    }
    
    return FALSE;
}

- (void)timeCount {
    
    timeLimit--;
    
    self.lblCountDown.text = [NSString stringWithFormat:@"%d",timeLimit];
    
    if (timeLimit > 0) {
        
        if ([self checkAnswer:randomPositionResultValue]) {

                [self setScore:timeLimit];
                [self resetConfig];
                [self initNumber];
            
        } else {
            
            if (timeLimit <= 0) {
                [self gameOver];
            }
  
        }
        
    } else {
        
        [self gameOver];
        
    }
    
}

-(void)gameOver {
    
    [self resetConfig];
    
    self.lblStatus.text = @"GAME OVER!!!";
    [self.btnNewGame setUserInteractionEnabled:YES];
    
    // MARK: How to save score to cloud Apple? file shared
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
}

- (void)setScore:(int)score {
    
    countScore += score;
    
    self.lblScore.text = [NSString stringWithFormat:@"Your score: %d",countScore];
    
    if (score == 3) {
        self.lblStatus.text = @"3 POINTS";
    } else if (score == 2){
        self.lblStatus.text = @"2 POINTS";
    } else {
        self.lblStatus.text = @"1 POINT";
    }
    
    [self resetConfig];
}

- (void)resetConfig {
    [timer invalidate];
    timer = nil;
    
    self.btn1.tag = 0;
    self.btn2.tag = 0;
    self.btn3.tag = 0;
}

- (int)randomNumber:(int)upperBound {
    // MARK: - used function random built-in OS in range 1...3
    return arc4random_uniform(upperBound);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1Press:(id)sender {
    self.btn1.backgroundColor = [UIColor redColor];
    self.btn2.backgroundColor = [UIColor lightGrayColor];
    self.btn3.backgroundColor = [UIColor lightGrayColor];
    
    [sender setTag:1];
    
}

- (IBAction)btn2Press:(id)sender {
    self.btn2.backgroundColor = [UIColor redColor];
    self.btn1.backgroundColor = [UIColor lightGrayColor];
    self.btn3.backgroundColor = [UIColor lightGrayColor];
    
    [sender setTag:2];
}

- (IBAction)btn3Press:(id)sender {
    self.btn3.backgroundColor = [UIColor redColor];
    self.btn2.backgroundColor = [UIColor lightGrayColor];
    self.btn1.backgroundColor = [UIColor lightGrayColor];
    
    [sender setTag:3];
}

- (IBAction)btnNewGame:(id)sender {
    countScore = 0;
    self.lblStatus.text = @"";
    self.lblScore.text = @"Your score: 0";
    [self initNumber];
}


@end
