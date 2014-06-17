//
//  DevRater.h
//  asdf
//
//  Created by Nick Culbertson on 4/16/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>




@interface DevRater : UIViewController<UIAlertViewDelegate, MFMailComposeViewControllerDelegate>{
    NSUserDefaults *defaults;
    UILabel *label1a;
    UILabel *label2a;
    UILabel *label3a;
    UIScrollView *someScrollView1;
    UIScrollView *someScrollView2;
    UIImageView *lineView1;
    UIImageView *lineView2;
    UIImageView *ImageView1;
    UIImageView *ImageView2;
    UIImageView *ImageView3;
    UIImageView *ImageView2b;
    UIImageView *ImageView3b;
    UIImageView *ImageView4;
    UIImageView *ImageView5;
    UIButton *star1;
    UIButton *star2;
    UIButton *star3;
    UIButton *star4;
    UIButton *star5;
    UIButton *AlertButton1;
    UIButton *AlertButton2;
    UIButton *AlertButton3;
    UIButton *someImageView1;
    UIButton *someImageView2;
    UIImageView *myImageView;
    int CountStar;
}
- (void)show;
- (void)show2;
- (void)star1press;
- (void)star2press;
- (void)star3press;
- (void)star4press;
- (void)star5press;
- (void)movestars1;
- (void)movestars2;
- (void)alert1press;
- (void)alert2press;
- (void)alert3press;
- (void)HighRate;
- (void)LowRate;


@property (nonatomic, copy) NSString *applicationName;
@property (nonatomic, copy) NSString *applicationIcon;





@end
