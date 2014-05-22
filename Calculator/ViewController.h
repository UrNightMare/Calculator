//
//  ViewController.h
//  Calculator
//
//  Created by George Sabanov on 05.03.14.
//  Copyright (c) 2014 Goga Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "math.h"
#import <iAd/iAd.h>
#import <AudioToolbox/AudioToolbox.h>
@interface ViewController : UIViewController<ADBannerViewDelegate> {
    BOOL isNewEnter;
    double lastValue;
    NSInteger lastSign;
    SystemSoundID PlaySoundID;
}

- (IBAction)RightSlideRecognizer:(id)sender;
@property (nonatomic, strong) IBOutlet UITextField* textField;
-(IBAction)digitPushedBy:(id) sender;

@end
