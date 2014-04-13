//
//  ViewController.h
//  Calculator
//
//  Created by George Sabanov on 05.03.14.
//  Copyright (c) 2014 Goga Industries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "math.h"
@interface ViewController : UIViewController {
    BOOL isNewEnter;
    double lastValue;
    NSInteger lastSign;
 
}

- (IBAction)RightSlideRecognizer:(id)sender;
@property (nonatomic, strong) IBOutlet UITextField* textField;
-(IBAction)digitPushedBy:(id) sender;

@end
