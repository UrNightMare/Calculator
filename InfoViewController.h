//
//  InfoViewController.h
//  CalcYouLater
//
//  Created by George Sabanov on 07.05.14.
//  Copyright (c) 2014 George Sabanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "GADBannerView.h"
NSInteger HighScoreNumber;

@interface InfoViewController : UIViewController <ADBannerViewDelegate, GADBannerViewDelegate>
{
    IBOutlet UILabel *HighScore;
    GADBannerView *gbanner;
    ADBannerView *banner;
}

@end
