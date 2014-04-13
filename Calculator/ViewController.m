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
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(check) userInfo:nil repeats:YES];
    [super viewDidLoad];
	isNewEnter = YES;
}
-(void)check {
    if ([self.textField.text length] >= 25){
        self.textField.text = [self.textField.text substringWithRange:NSMakeRange(0,24)];
    }
}

- (IBAction)zeroPushed:(id)sender {
    if (isNewEnter)
    {
        if ([self.textField.text length] < 2) {
        self.textField.text = @"";
        isNewEnter = NO;
        }
        if ([self.textField.text length] <= 2) {
        self.textField.text = @"";
            isNewEnter = YES;
        }
    }
    NSString* CurrentnumberAsString = [NSString stringWithFormat:@"%li", (long)[sender tag]];
    NSString* currentValue = self.textField.text;
    currentValue = [currentValue stringByAppendingString:CurrentnumberAsString];
    self.textField.text = currentValue;

}
 - (IBAction)digitPushedBy:(id) sender {
     
    if (isNewEnter)
    {
    self.textField.text = @"";
    isNewEnter = NO;
 }
    NSString* CurrentnumberAsString = [NSString stringWithFormat:@"%li", (long)[sender tag]];
    NSString* currentValue = self.textField.text;
    currentValue = [currentValue stringByAppendingString:CurrentnumberAsString];
    self.textField.text = currentValue;
 }



- (BOOL)textField:(UILabel *)aTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
         // "Length of existing text" - "Length of replaced text" + "Length of replacement text"
         NSInteger newTextLength = [aTextView.text length] - range.length + [text length];
         
         if (newTextLength > 10) {
             // don't allow change
             return NO;
         }
         self.textField.text = [NSString stringWithFormat:@"%li", (long)newTextLength];
         return YES;
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


- (IBAction)RightSlideRecognizer:(id)sender
{

        NSString * current = self.textField.text;
        NSString * new = [current substringToIndex:[current length] - 1];
        if ([new length] > 0)
        {
            self.textField.text = new;
        }
        else
        {
            isNewEnter = NO;
            self.textField.text = @" ";
        }
    
}





-(IBAction)squarePushed:(id)sender {
    double currentValue = [self.textField.text doubleValue];
    
    currentValue = currentValue*currentValue;
    
    isNewEnter = NO;
    
    self.textField.text = [[NSNumber numberWithDouble:currentValue] stringValue];
}

-(IBAction)cubePushed:(id)sender {
    double currentValue = [self.textField.text doubleValue];
    
    currentValue = currentValue*currentValue*currentValue;
    
    isNewEnter = NO;
    
    self.textField.text = [[NSNumber numberWithDouble:currentValue] stringValue];
}
-(IBAction)cbrtPushed:(id)sender {
    double currentValue = [self.textField.text doubleValue];
    
    currentValue = cbrt(currentValue);
    
    lastValue = currentValue;
    isNewEnter = NO;
    
    self.textField.text = [[NSNumber numberWithDouble:currentValue] stringValue];
    
}

-(IBAction)percentPushed:(id)sender {
    double currentValue = [self.textField.text doubleValue];
    
    currentValue = currentValue/100;
    
    lastValue = currentValue;
    isNewEnter = NO;
    
    self.textField.text = [[NSNumber numberWithDouble:currentValue] stringValue];
    
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
