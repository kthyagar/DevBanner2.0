//
//  DevRater.h
//  asdf
//
//  Created by Nick Culbertson on 4/16/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DevRater : UIViewController{
    NSUserDefaults *defaults;
    UILabel *label1a;
    UILabel *label2a;
    UILabel *label3a;
    UIScrollView *someScrollView1;
    UIImageView *ImageView1;
    UIImageView *ImageView2;
    UIImageView *ImageView3;
    UIImageView *ImageView4;
    UIImageView *ImageView5;
    UIButton *star1;
    UIButton *star2;
    UIButton *star3;
    UIButton *star4;
    UIButton *star5;
    UIButton *someImageView1;
    UIButton *someImageView2;
}
- (void)show;
- (void)star1press;
- (void)star2press;
- (void)star3press;
- (void)star4press;
- (void)star5press;

@property (nonatomic, copy) NSString *applicationName;
@property (nonatomic, copy) NSString *applicationIcon;

@end
