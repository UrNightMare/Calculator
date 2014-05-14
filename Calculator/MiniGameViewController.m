//
//  MiniGameViewController.m
//  CalcYouLater
//
//  Created by George Sabanov on 09.05.14.
//  Copyright (c) 2014 George Sabanov. All rights reserved.
//

#import "MiniGameViewController.h"

@interface MiniGameViewController ()

@end

@implementation MiniGameViewController


-(IBAction)startGame:(id)sender {
    
    startGame.hidden = YES;
    
    birdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(birdMoving) userInfo:nil repeats:YES];
    [self placeTunnels];
    
    tunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tunnelMoving) userInfo:nil repeats:YES];
    tunnelBottom.hidden = NO;
    tunnelTop.hidden = NO;
}

-(void)tunnelMoving {
    
    tunnelTop.center = CGPointMake(tunnelTop.center.x - 1, tunnelTop.center.y);
    tunnelBottom.center = CGPointMake(tunnelBottom.center.x - 1, tunnelBottom.center.y);
    if (tunnelTop.center.x < -28) {
        
    [self placeTunnels];
    
    }
    if (tunnelTop.center.x == 0){
        
        [self Score];
    }
    if (CGRectIntersectsRect(Bird.frame, tunnelTop.frame)) {
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame, tunnelBottom.frame)) {
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame, Top.frame)) {
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame)) {
        [self GameOver];
    }
    
}
-(void)GameOver {
    [tunnelMovement invalidate];
    [birdMovement invalidate];
    
    Exit.hidden = NO;
    //tunnelTop.hidden = YES;
    //tunnelBottom.hidden = YES;
    Bird.hidden = YES;
    if (scoreNumber > HighScoreNumber) {
        
        [[NSUserDefaults standardUserDefaults] setInteger:scoreNumber forKey:@"HighScoreSaved"];
        
        
        
    }
}

-(void)Score {
    
    scoreNumber = scoreNumber +1;
    scoreLabel.text = [NSString stringWithFormat:@"%i",scoreNumber];
    
}
-(BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)placeTunnels {
    
    randomTopTunnelPosition = arc4random() %350;
    randomTopTunnelPosition = randomTopTunnelPosition -190;
    randomBottomTunnelPosition = randomTopTunnelPosition +550;
    
    tunnelTop.center = CGPointMake(340, randomTopTunnelPosition );
    tunnelBottom.center = CGPointMake(340, randomBottomTunnelPosition);
    
}

-(void)birdMoving {
    birdFlight = birdFlight -5;
    
    if (birdFlight < -15) {
        birdFlight = -15;
    }
     Bird.center = CGPointMake(Bird.center.x, Bird.center.y - birdFlight);
       if (birdFlight > 0) {
          Bird.image = [UIImage imageNamed:@"Bird.png"];
      }
      if (birdFlight < 0) {
       Bird.image = [UIImage imageNamed:@"Bird Fall.png"];
     }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    birdFlight = 25;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    tunnelTop.hidden = YES;
    tunnelBottom.hidden = YES;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    Exit.hidden = YES;
    scoreNumber = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
