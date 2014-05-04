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
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(check) userInfo:nil repeats:YES];
    [super viewDidLoad];
	isNewEnter = YES;
}
-(void)check {
   if ([self.textField.text length] >= 12){
       self.textField.text = [self.textField.text substringWithRange:NSMakeRange(0,11)];
    }
}

- (IBAction)zeroPushed:(id)sender {
    if (isNewEnter)
    {
        NSString* CurrentnumberAsString = [NSString stringWithFormat:@"%li", (long)[sender tag]];
        NSString* currentValue = self.textField.text;
        currentValue = [currentValue stringByAppendingString:CurrentnumberAsString];
        self.textField.text = currentValue;
        
        
        if ([self.textField.text length] > 2) {
            self.textField.text = @"";
            
        }
        if ([self.textField.text length] <=2 >0) {
            self.textField.text = 0;
            isNewEnter = YES;
        }
        if ([self.textField.text length] ==1) {
            self.textField.text = @"";
            
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



- (BOOL)textField:(UILabel *)textField shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    // "Length of existing text" - "Length of replaced text" + "Length of replacement text"
    NSInteger newTextLength = [textField.text length] - range.length + [text length];
    
    if (newTextLength > 12) {
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
    if ([self.textField.text length] ==1) {
        isNewEnter = NO;
    }
    
    self.textField.text = [self.textField.text stringByAppendingString:@"."];
    
}

- (IBAction)clearPushed:(id)sender {
    self.textField.text = @"0";
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
        else        {
            isNewEnter = YES;
            self.textField.text = @"0";
        }
    if (current <= 0) {
        self.textField.text = @"0";
    }
    
}

/*
- (IBAction)LeftSlideRecognizer:(id)sender
{
    NSString * current = self.textField.text;
    NSString * new = [current substringToIndex:[current length] ];
    if ([new length] > 0)
    {
        self.textField.text = new;
    }
    else
    {
        isNewEnter = YES;
        self.textField.text = @"0";
    }
    
}



*/




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
    isNewEnter = YES;
    
    self.textField.text = [[NSNumber numberWithDouble:currentValue] stringValue];
    
}
-(IBAction)sqrtPushed:(id)sender {
    double currentValue = [self.textField.text doubleValue];
    
    currentValue = sqrt(currentValue);
    
    
    lastValue = currentValue;
    isNewEnter = YES;
    
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
