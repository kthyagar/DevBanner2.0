//
//  DevBanner.h
//  asdf
//
//  Created by Nick Culbertson on 2/22/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DevBanner : UIViewController
{
    UIScrollView *someScrollView1;
    UIImageView *someImageView1;
    UIImageView *someImageView2;
    UIImageView *someImageView3;
    UIImageView *someImageView4;
    UIImageView *someImageView5;
    UIButton *someButtonView1;
    UIButton *someButtonView2;
    UIButton *someButtonView3;
    UIButton *someButtonView4;
    UIButton *someButtonView5;
    
    UILabel *appNameLabel;
    UILabel *publisherNameLabel;
    UILabel *priceLabel;
    UIImage *img1;
    UIImage *img1P;
    UIImage *img2P;
    UIImage *img3P;
    UIImage *img4P;
    UIImage *img5P;
    UIImage *img1L;
    UIImageView *ImageView1;
    UIImageView *ImageView2;
    NSArray* adimagesP;
    NSArray* adimagesL;
    
    NSUInteger numObjectsP;
    NSUserDefaults *defaults;
    int Countfirstlaunch;
    int Countmode;
    int countState;
    int Countdelay;
    int Countnetwork;
    int Countad;
    int BannerHeight;
    NSArray* adimagesP2;
    NSArray *jsonarray;
}
- (void)show;
- (void)showAd;
- (void)hide;
@property(nonatomic, copy) NSString *CampaignID;
@property(nonatomic, copy) NSArray *AppID;

@property(nonatomic, readonly) UIDeviceOrientation orientation;

@end

extern const int PORTRAIT_BANNER_X;
extern const int PORTRAIT_BANNER_Y;
extern const int PORTRAIT_BANNER_HORIZONTAL_MARGIN;
extern const int PORTRAIT_BANNER_VERTICAL_MARGIN;
extern const int APP_NAME_LABEL_PORTRAIT_X_OFFSET;
extern const int APP_NAME_LABEL_PORTRAIT_Y_OFFSET;
extern const int PUBLISHER_NAME_LABEL_PORTRAIT_X_OFFSET;
extern const int PUBLISHER_NAME_LABEL_PORTRAIT_Y_OFFSET;
extern const int PRICE_LABEL_PORTRAIT_X_OFFSET;
extern const int PRICE_LABEL_PORTRAIT_Y_OFFSET;
extern const int PORTRAIT_LABEL_WIDTH;
extern const int PORTRAIT_VIEW_CORNER_RADIUS;

extern const int LANDSCAPE_BANNER_X;
extern const int LANDSCAPE_BANNER_Y;
extern const int LANDSCAPE_BANNER_HORIZONTAL_MARGIN;
extern const int LANDSCAPE_BANNER_VERTICAL_MARGIN;
extern const int APP_NAME_LABEL_LANDSCAPE_X_OFFSET;
extern const int APP_NAME_LABEL_LANDSCAPE_Y_OFFSET;
extern const int PUBLISHER_NAME_LABEL_LANDSCAPE_X_OFFSET;
extern const int PUBLISHER_NAME_LABEL_LANDSCAPE_Y_OFFSET;
extern const int PRICE_LABEL_LANDSCAPE_X_OFFSET;
extern const int PRICE_LABEL_LANDSCAPE_Y_OFFSET;
extern const int LANDSCAPE_LABEL_WIDTH;
extern const int LANDSCAPE_VIEW_CORNER_RADIUS;
