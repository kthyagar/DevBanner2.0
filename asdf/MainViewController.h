//
//  MainViewController.h
//  asdf
//
//  Created by Nick Culbertson on 2/20/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import "FlipsideViewController.h"
@class DevBanner;
@class DevRater;

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UITextFieldDelegate, UIPopoverControllerDelegate>{
    DevBanner *adbanner;
    DevRater *rateme;
    IBOutlet UITextField *jsontext;
}
-(IBAction)loadbanner;
-(IBAction)resume;
-(IBAction)ShowRateAlert;
-(IBAction)hide;
-(IBAction)resetDict;
@property (nonatomic, strong) UIView* customView;
@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (strong, nonatomic) UITextField *jsontext;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

@end