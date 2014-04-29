//
//  BannerInfo.h
//  asdf
//
//  Created by Karthi Thyagarajan on 4/28/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerInfo : NSObject
{
}

@property (nonatomic, strong) NSString *AppName;
@property (nonatomic, strong) NSString *AppPrice;
@property (nonatomic, strong) NSString *FormattedAppPrice;
@property (nonatomic, strong) NSString *AppUrl;
@property (nonatomic, strong) UIImage *AppImage;
@end
