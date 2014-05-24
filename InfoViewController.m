//
//  InfoViewController.m
//  CalcYouLater
//
//  Created by George Sabanov on 07.05.14.
//  Copyright (c) 2014 George Sabanov. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
@property ADBannerView *banner;
@property GADBannerView *gbanner;
@end

@implementation InfoViewController
@synthesize banner = _banner;
@synthesize gbanner = _gbanner;
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

    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    HighScore.text = [NSString stringWithFormat: @"High Score: %li", (long)HighScoreNumber];
    
    [super viewDidLoad];
   // float y = [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - gbanner.frame.size.height - 30;

   // gbanner = [[GADBannerView alloc] initWithFrame:CGRectMake(0,y, 320, 50)];
    
   // gbanner.adUnitID= @"ca-app-pub-4048704989491181/6671544752";
   
   // gbanner.rootViewController = self;
   // [self.view addSubview:gbanner];
   // [gbanner loadRequest:[GADRequest request]];
    
}
//- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error {
//    [self.gbanner removeFromSuperview];
//}
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
 
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
   
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
    
    
}
/*
-(void)bannerView1:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
    
}
*/

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
