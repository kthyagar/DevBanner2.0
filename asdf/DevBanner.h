//
//  DevBanner.h
//  asdf
//
//  Created by Nick Culbertson/Karthi T on 2/22/14.
//  Copyright (c) 2014 Nick Culbertson/Karthi T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DevBanner : UIViewController
{
    UILabel *appNameLabel;
    UILabel *publisherNameLabel;
    UILabel *priceLabel;
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
- (void)setupAdInfo;
- (void)hide;
@property(nonatomic, copy) NSString *DeveloperId;
@property(nonatomic, copy) NSString *AppType;
@property(nonatomic, copy) NSArray *AppID;

@property(nonatomic, readonly) UIDeviceOrientation orientation;

@end

extern const int MAX_BANNERS;
extern const int BANNER_SWAP_DELAY_IN_SECS;

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
