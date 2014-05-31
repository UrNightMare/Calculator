//
//  MiniGameViewController.h
//  CalcYouLater
//
//  Created by George Sabanov on 09.05.14.
//  Copyright (c) 2014 George Sabanov. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <AdColony/AdColony.h>
int birdFlight;
int randomTopTunnelPosition;
int randomBottomTunnelPosition;
int scoreNumber;
NSInteger HighScoreNumber;


@interface MiniGameViewController : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *startGame;
    IBOutlet UIImageView *tunnelTop;
    IBOutlet UIImageView *tunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *scoreLabel;
    
    
    NSTimer *tunnelMovement;
    NSTimer *birdMovement;
    
}


-(IBAction)startGame:(id)sender;
-(void)birdMoving;
-(void)tunnelMoving;
-(void)placeTunnels;
-(void)Score;
-(void)GameOver;

@end
