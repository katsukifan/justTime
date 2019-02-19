//
//  ViewController.m
//  justTime
//
//  Created by 张岳涛 on 19/2/16.
//  Copyright © 2019年 张岳涛. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>



@interface ViewController ()

@end

@implementation ViewController

{
    
    __weak IBOutlet UILabel *timeLabel;
    
    NSTimer *timer;
    
    int timerCount;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)stop:(id)sender {
    
    [timer invalidate];
    
    if (timerCount == 10) {
        
        timeLabel.text = @"恭喜，绝对时间！！";
    }
    
    
}



- (IBAction)start:(id)sender {
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(upDateTimer) userInfo:nil repeats:YES];
    
    
}

-(void)upDateTimer{
    timerCount = timerCount + 1;
    timeLabel.text = [NSString stringWithFormat:@"%d",timerCount];
}


- (IBAction)reset:(id)sender {
    
    timerCount = 0 ;
    timeLabel.text = @"0";
}



- (IBAction)shareFacebook:(id)sender {
    [self shareFB];
}


- (IBAction)shareTwitter:(id)sender {
    [self shareTw];
}


-(void)shareFB{
    
    NSString *serviceType = SLServiceTypeFacebook;
    if ([SLComposeViewController isAvailableForServiceType:serviceType]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        [controller setInitialText:@"绝对时刻的王者！！"];
        
        
        [self presentViewController:controller
                           animated:YES
                         completion:NULL];
    }
}


-(void)shareTw{
    
    NSString *serviceType = SLServiceTypeTwitter;
    if ([SLComposeViewController isAvailableForServiceType:serviceType]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        
        
        [controller setInitialText:@"绝对时刻的王者！！"];
        
        [self presentViewController:controller
                           animated:YES
                         completion:NULL];
    }
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
