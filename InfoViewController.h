//
//  InfoViewController.h
//  CalcYouLater
//
//  Created by George Sabanov on 07.05.14.
//  Copyright (c) 2014 George Sabanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

NSInteger HighScoreNumber;

@interface InfoViewController : UIViewController <ADBannerViewDelegate>
{
    IBOutlet UILabel *HighScore;
}
@end
