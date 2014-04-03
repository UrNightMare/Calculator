//
//  ViewController.h
//  Calculator
//
//  Created by George Sabanov on 05.03.14.
//  Copyright (c) 2014 Goga Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    BOOL isNewEnter;
    double lastValue;
    NSInteger lastSign;
    
    
    
}
@property (nonatomic, strong) IBOutlet UITextField* textField;
-(IBAction)digitPushedBy:(id) sender;

@end
