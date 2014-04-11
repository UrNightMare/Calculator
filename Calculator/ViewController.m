//
//  ViewController.m
//  Calculator
//
//  Created by George Sabanov on 05.03.14.
//  Copyright (c) 2014 Goga Industries. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	isNewEnter = YES;
}

- (IBAction)digitPushedBy:(id) sender {
        if (isNewEnter) {
        self.textField.text = @"";
        isNewEnter = NO;
        }
    
    NSString* CurrentnumberAsString = [NSString stringWithFormat:@"%li", (long)[sender tag]];
    NSString* currentValue = self.textField.text;
    currentValue = [currentValue stringByAppendingString:CurrentnumberAsString];
    self.textField.text = currentValue;
}

- (IBAction)pointPushed:(id)sender {
    NSRange range = [self.textField.text rangeOfString:@"."];
    if (range.location != NSNotFound) {
        return;
    }
    self.textField.text = [self.textField.text stringByAppendingString:@"."];
}

- (IBAction)clearPushed:(id)sender {
    self.textField.text = @"";
    isNewEnter = YES;
    lastSign = 0;
    lastValue = 0;

}
-(IBAction)sqrtPushed:(id)sender {
    double currentValue = [self.textField.text doubleValue];
    
    currentValue = sqrt(currentValue);
    
    
    lastValue = currentValue;
    isNewEnter = NO;
    
    self.textField.text = [[NSNumber numberWithDouble:currentValue] stringValue];
    
    
}
- (IBAction)invPushed:(id)sender {
    
    double currentValue = [self.textField.text doubleValue];
    
        currentValue = -1*currentValue;
    
    lastValue = currentValue;
    isNewEnter = NO;
    
    self.textField.text = [[NSNumber numberWithDouble:currentValue] stringValue];
}

- (IBAction)signPushed:(id)sender {
    if (isNewEnter && lastSign != 0) {
        return;
    }
    
    double currentValue = [self.textField.text doubleValue];
    
    if (lastSign == 1001)  {
    currentValue = currentValue+lastValue;
    }
    if (lastSign == 1002) {
    currentValue = lastValue-currentValue;
    }
    if (lastSign == 1003) {
    currentValue = currentValue*lastValue;
    }
    if (lastSign == 1004 && currentValue != 0) {
    currentValue =lastValue/currentValue;
    }
  //  if (lastSign == 1010) {
   // currentValue = sqrt(currentValue);
   // }

    
    lastValue = currentValue;
    lastSign = [sender tag];
    isNewEnter = YES;
    
    self.textField.text = [[NSNumber numberWithDouble:currentValue] stringValue];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
