//
//  DevBanner.m
//
//  Created by Nick Culbertson/Karthi T on 2/22/14.
//  Copyright (c) 2014 Nick Culbertson/Karthi T. All rights reserved.
//

#import "DevBanner.h"

@interface DevBanner()
@property (nonatomic, strong) UIImageView *BannerImageView;
@property (nonatomic, strong) UIImageView *BannerBackgroundImageView;
@property (nonatomic, strong) UIButton *BannerButton;
@property (nonatomic, strong) UIScrollView *ContainerView;
@property (nonatomic, strong) NSMutableArray *BannerImages;
@property (nonatomic, strong) UIImage *PortraitBackgroundImage;
@property (nonatomic, strong) UIImage *LandscapeBackgroundImage;
@end

@implementation DevBanner

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define AppStoreURLFormat @"itms-apps://itunes.apple.com/app/id";

/// hide
- (void)hide
{
    countState=2;
    self.ContainerView.hidden=YES;
    [self userActionOff];
    
    [self.view setFrame:CGRectMake(0,[[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
}


- (void)userActionOn
{
    //Do your own Custom Animations here for Show
}

/// userActionOff
- (void)userActionOff
{
    //Do your own Custom Animations here for Remove
    
}

/// show
- (void)show
{
    if(countState==1)
    {
        NSLog(@"Ad Already Init");
        
        return;
    }
    else if(countState==2)
    {
        countState=1;
        NSLog(@"Ad Already Init");
        self.ContainerView.hidden=NO;
        [self orientViews];
        [self userActionOn];
        
        return;
    }
    else if(countState==3)
    {
        countState=1;
        self.ContainerView.hidden=NO;
        [self orientViews];
        [self userActionOn];
        
        [self swapBanner];
        
        return;
    }
    
    countState = 1;
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"StoreLink"]==NULL)
    {
        dispatch_async(kBgQueue, ^{
            NSString *stringBuilder = @"http://www.myindieapp.com/adjazz_1.json";
            NSLog(@"%@",stringBuilder);
            
            NSURL* kjsonURL = [NSURL URLWithString:stringBuilder];
            
            NSData* data2 = [NSData dataWithContentsOfURL:kjsonURL];
            
            [self performSelectorOnMainThread:@selector(onInitialJsonFetch:) withObject:data2 waitUntilDone:YES];
        });
    }
    else
    {
        NSLog(@"JSON Reuse");
        Countnetwork=1;
        [self initializeLabelsAndCount];
        NSLog(@"%@",_AppID);
        [self setupAdInfo];
    }
}

/// onInitialJsonFetch
- (void)onInitialJsonFetch:(NSData *)responseData
{
    NSError* error;
    
    if(responseData==nil)
    {
        NSLog(@"JSON Can't Find Data");
        
        return;
    }
    else
    {
        NSLog(@"JSON Get");
        Countnetwork=1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData
                                                             options:kNilOptions
                                                               error:&error];
        
        jsonarray = [json objectForKey:@"adlist"];
        
        NSLog(@"%@",jsonarray);//
        
        if(jsonarray==NULL)
        {
            NSLog(@"JSON Object Not There");
            return;
        }
        
        NSString *stringBuilder = [jsonarray objectAtIndex:1];
        NSString *stringBuilder2 = [jsonarray objectAtIndex:1];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            stringBuilder = [stringBuilder stringByAppendingString:@"1"];
            stringBuilder2 = [stringBuilder2 stringByAppendingString:@"2"];
        }
        else
        {
            stringBuilder = [stringBuilder stringByAppendingString:@"3"];
            stringBuilder2 = [stringBuilder2 stringByAppendingString:@"4"];
        }
        
        NSLog(@"%@",stringBuilder);
        
        [defaults setValue:[jsonarray objectAtIndex:0] forKey:@"LinkURL"];
        [defaults setValue:stringBuilder forKey:@"PortraitURL"];
        [defaults setValue:stringBuilder2 forKey:@"LandscapeURL"];
        [defaults synchronize];
        
        [self fetchFromAppStoreAndShow];
    }
}

/// fetchFromAppStoreAndShow
- (void)fetchFromAppStoreAndShow
{
    dispatch_async(kBgQueue, ^{
        NSString *stringBuilder = @"https://itunes.apple.com/lookup?id=";
        stringBuilder = [stringBuilder stringByAppendingString:_CampaignID];
        NSLocale *locale = [NSLocale currentLocale];
        stringBuilder = [stringBuilder stringByAppendingString:@"&entity=software&country="];
        
        stringBuilder = [stringBuilder stringByAppendingString:[locale objectForKey: NSLocaleCountryCode]];
        NSLog(@"%@",stringBuilder);
        
        NSURL* kjsonURL = [NSURL URLWithString:stringBuilder];
        
        NSData* data2 = [NSData dataWithContentsOfURL:kjsonURL];
        
        [self performSelectorOnMainThread:@selector(onAppStoreFetch:) withObject:data2 waitUntilDone:YES];
    });
}

/// onAppStoreFetch
- (void)onAppStoreFetch:(NSData *)responseData
{
    NSError* error;
    
    if(responseData==nil)
    {
        NSLog(@"JSON Can't Find Data");
        
        return;
    }
    else
    {
        NSLog(@"JSON Get");
        Countnetwork = 1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData
                                                             options:kNilOptions
                                                               error:&error];
        
        jsonarray = [json objectForKey:@"results"];
        
        NSLog(@"%@",_AppID);
        NSLog(@"%@",jsonarray);
        
        if(jsonarray==NULL)
        {
            NSLog(@"JSON Object Not There");
            return;
        }
        else
        {
            NSLog(@"JSON GET SUCCESS");
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setValue:jsonarray forKey:@"DevBannerJSON"];
            [defaults synchronize];
            [self initializeLabelsAndCount];
            [self setupAdInfo];
        }
    }
}

/// setupAdInfo
- (void)setupAdInfo
{
    NSLog(@"Downloading...");
    defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    if(numObjectsP==0)
    {
        return;
    }
    
    NSUInteger Countmax;
    
    Countmax = numObjectsP;
    
    if(numObjectsP >= MAX_BANNERS)
    {
        Countmax = MAX_BANNERS;
    }
    
    int i = 1;
    int j = 1;
    self.BannerImages = [NSMutableArray array];
    while(j <= Countmax && i <= Countmax)
    {
        NSString *storelink = [NSString stringWithFormat:@"StoreLink%d", j];
        NSString *appname = [NSString stringWithFormat:@"AppName%d", j];
        NSString *appprice = [NSString stringWithFormat:@"AppPrice%d", j];
        NSString *filename = [NSString stringWithFormat:@"/Ad_%dP.png", j];
        NSString* string= [jsonarray[i] objectForKey:@"kind"];
        NSString* string1= [NSString stringWithFormat:@"%@",[jsonarray[i] objectForKey:@"price"]];
        
        NSString* appNameValue = [jsonarray[i] objectForKey:@"trackName"];
        NSString* priceValue = [NSString stringWithFormat:@"%@ - On the App Store", [jsonarray[i] objectForKey:@"formattedPrice"]];
        
        NSLog(@"I Am The Number %@",string);
        NSLog(@"I Am The Number %@",appNameValue);
        
        if([string isEqualToString:@"mac-software"]){
            NSLog(@"Mac App Skipped");
            
            i++;
            numObjectsP--;
            NSLog(@"I Am The Number %lu",(unsigned long)numObjectsP);
            continue;
        }
        
        if([[NSUserDefaults standardUserDefaults] valueForKey:storelink]==NULL)
        {
            NSString* stringBuilder1= [jsonarray[i] objectForKey:@"artworkUrl512"];
            
            NSString* urlBuilder1=@"itms-apps://itunes.apple.com/app/id";
            NSString* urlBuilder2= [[jsonarray[i] objectForKey:@"trackId"] stringValue];
            NSString* urlBuilder3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"LinkURL"];
            urlBuilder1 = [urlBuilder1 stringByAppendingString:urlBuilder2];
            urlBuilder1 = [urlBuilder1 stringByAppendingString:urlBuilder3];
            
            NSData *imageData1P = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringBuilder1]];
            
            NSLog(@"Saving Image %d",i);
            NSString *imagePath1P =
            [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:filename];
            [imageData1P writeToFile:imagePath1P atomically:YES];
            [defaults setValue:urlBuilder1 forKey:storelink];
            [defaults setValue:appNameValue forKey:appname];
            [defaults setValue:priceValue forKey:appprice];
            [defaults synchronize];
        }
        
        NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:filename];
        
        [self.BannerImages addObject:[UIImage imageWithContentsOfFile:getImagePath]];
        
        i++;
        j++;
    }

    // portrait and landscape background images
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"StoreLink"]==NULL){
        
        NSData *imageData1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults] valueForKey:@"PortraitURL"]]];
        NSData *imageData2 = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults] valueForKey:@"LandscapeURL"]]];
        
        NSString *imagePath1 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"/Ad_Image_1.png"];
        
        NSString *imagePath2 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"/Ad_Image_2.png"];
        
        [imageData1 writeToFile:imagePath1 atomically:YES];
        [imageData2 writeToFile:imagePath2 atomically:YES];
        
        [defaults setValue:imagePath1 forKey:@"StoreLink"];
        [defaults synchronize];
    }
    else
    {
        NSLog(@"Image Found");
    }

    NSString *portraitImagePath = [documentsDirectory stringByAppendingPathComponent:@"/Ad_Image_1.png"];
    self.PortraitBackgroundImage = [UIImage imageWithContentsOfFile:portraitImagePath];

    NSString *landscapeImagePath = [documentsDirectory stringByAppendingPathComponent:@"/Ad_Image_2.png"];
    self.LandscapeBackgroundImage = [UIImage imageWithContentsOfFile:landscapeImagePath];

    [self constructViews];
    [self orientViews];

    [self.view addSubview:self.ContainerView];
    [self userActionOn];

    Countad=0;
    Countmode=1;

    [self swapBanner];

    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(handleOrientationChangeNotification:) name: UIDeviceOrientationDidChangeNotification object: nil];
}

/// handleOrientationChangeNotification
-(void)handleOrientationChangeNotification:(NSNotification *)notification
{
    [self orientViews];
}

-(void) initializeLabelsAndCount
{
    jsonarray = [[NSUserDefaults standardUserDefaults] objectForKey:@"DevBannerJSON"];
    
    NSString* publisherName= [jsonarray[0] objectForKey:@"artistName"];
    NSString* appName= [jsonarray[1] objectForKey:@"trackName"];
    NSString* price=[NSString stringWithFormat:@"%@ - On the App Store", [jsonarray[1] objectForKey:@"formattedPrice"]];
    NSString* appId= [jsonarray[1] objectForKey:@"trackId"];
    
    NSLog(@"%@",appName);
    NSLog(@"%@",publisherName);
    NSLog(@"%@",price);
    NSLog(@"%@",appId);
    
    appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+8,-12, 180, BannerHeight)];
    publisherNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+15,0, 180, BannerHeight)];
    priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+23,11, 180, BannerHeight)];
    
    appNameLabel.text = appName;
    publisherNameLabel.text = publisherName;
    priceLabel.text = price;
    
    [appNameLabel setTextColor:[UIColor whiteColor]];
    [publisherNameLabel setTextColor:[UIColor whiteColor]];
    [priceLabel setTextColor:[UIColor whiteColor]];
    
    appNameLabel.shadowColor =[UIColor colorWithWhite:0 alpha:.8];
    appNameLabel.shadowOffset = CGSizeMake(1,1);
    publisherNameLabel.shadowColor =[UIColor colorWithWhite:0 alpha:.8];
    publisherNameLabel.shadowOffset = CGSizeMake(1,1);
    priceLabel.shadowColor =[UIColor colorWithWhite:0 alpha:.8];
    priceLabel.shadowOffset = CGSizeMake(1,1);

    [self setupLabelFonts];
    
    numObjectsP = [jsonarray count]-1;
    
    Countdelay = BANNER_SWAP_DELAY_IN_SECS;
}

-(void)setupLabelFonts
{
    [appNameLabel setFont:[UIFont systemFontOfSize:11]];
    [publisherNameLabel setFont:[UIFont systemFontOfSize:8]];
    [priceLabel setFont:[UIFont systemFontOfSize:8]];
}

-(void)adClicked
{
    NSString* storeUrlStr = @"itms-apps://itunes.apple.com/app/id";
    NSString* currentlyShownAppId = [[jsonarray[Countad] objectForKey:@"trackId"] stringValue];
    NSString* linkUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"LinkURL"];
    storeUrlStr = [storeUrlStr stringByAppendingString:currentlyShownAppId];
    storeUrlStr = [storeUrlStr stringByAppendingString:linkUrl];

    NSURL *storeUrl = [NSURL URLWithString:storeUrlStr];
    [[UIApplication sharedApplication]  openURL:storeUrl];
    NSLog(@"%@",storeUrl);
}

-(void)swapBanner
{
    if(countState==2)
    {
        countState=3;
        return;
    }
    
    //change color
    CGFloat value = ((float)rand() / RAND_MAX) * 255;
    CGFloat value1 = ((float)rand() / RAND_MAX) * 255;
    CGFloat value2 = ((float)rand() / RAND_MAX) * 255;
    CGFloat value3 = 1.0f;
    [self.ContainerView setBackgroundColor:[UIColor colorWithRed:value/255.0 green:value1/255.0  blue:value2/255.0 alpha:value3]];
    
    // Banner Flips
    
    Countad++;
    
    NSLog(@"Port it");
    if(numObjectsP<=1){
        Countad=0;
    }
    
    int imgCount = [self.BannerImages count];
    if(Countad > imgCount)
    {
        Countad = 1;
    }
    
    if(Countad > 0)
    {
        [self changeBannerImage];
    }
    
    //Add +1 to view count
    [self performSelector:@selector(swapBanner) withObject:nil afterDelay:Countdelay];
}

// constructViews
-(void)constructViews
{
    // alloc and init
    self.ContainerView = [[UIScrollView alloc] init];
    [self.ContainerView setBackgroundColor:[UIColor colorWithWhite:.2 alpha:.9]];
    [self.ContainerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    
    self.BannerBackgroundImageView = [[UIImageView alloc] init];
    self.BannerImageView = [[UIImageView alloc] init];
    self.BannerButton = [[UIButton alloc] init];
    
    [self.BannerButton addTarget:self action:@selector(adClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // setup hierarchies
    [self.ContainerView addSubview:self.BannerBackgroundImageView];
    [self.ContainerView addSubview:self.BannerImageView];
    [self.ContainerView addSubview:self.BannerButton];
    [self.ContainerView addSubview:appNameLabel];
    [self.ContainerView addSubview:publisherNameLabel];
    [self.ContainerView addSubview:priceLabel];
}

// orientViews
-(void)orientViews
{
    int width;
    int height;
    int bannerX;
    int bannerY;
    int bannerHorizontalMargin;
    int bannerVerticalMargin;
    int appNameLabelXOffset;
    int appNameLabelYOffset;
    int publisherNameLabelXOffset;
    int publisherNameLabelYOffset;
    int priceLabelXOffset;
    int priceLabelYOffset;
    int cornerRadius;
    int labelWidth;
    UIImage* imgToUse;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationPortrait)
    {
        NSLog(@"PORT");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            BannerHeight=50;
            //32   This is Landscape
        }
        else
        {
            BannerHeight=66;
            //90 Admob
        }

        imgToUse = self.PortraitBackgroundImage;

        width = [[UIScreen mainScreen] bounds].size.width;
        height = [[UIScreen mainScreen] bounds].size.height;
        bannerX = PORTRAIT_BANNER_X;
        bannerY = PORTRAIT_BANNER_Y;
        bannerHorizontalMargin = PORTRAIT_BANNER_HORIZONTAL_MARGIN;
        bannerVerticalMargin = PORTRAIT_BANNER_VERTICAL_MARGIN;
        appNameLabelXOffset = APP_NAME_LABEL_PORTRAIT_X_OFFSET;
        appNameLabelYOffset = APP_NAME_LABEL_PORTRAIT_Y_OFFSET;
        publisherNameLabelXOffset = PUBLISHER_NAME_LABEL_PORTRAIT_X_OFFSET;
        publisherNameLabelYOffset = PUBLISHER_NAME_LABEL_PORTRAIT_Y_OFFSET;
        priceLabelXOffset = PRICE_LABEL_PORTRAIT_X_OFFSET;
        priceLabelYOffset = PRICE_LABEL_PORTRAIT_Y_OFFSET;
        cornerRadius = PORTRAIT_VIEW_CORNER_RADIUS;
        labelWidth = PORTRAIT_LABEL_WIDTH;
    }
    else
    {
        NSLog(@"LAND");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            BannerHeight=32;
            
            //32   This is Landscape
        }
        else
        {
            BannerHeight=66;
            //90 Admob
        }
        
        imgToUse = self.LandscapeBackgroundImage;
        
        width = [[UIScreen mainScreen] bounds].size.height;
        height = [[UIScreen mainScreen] bounds].size.width;
        bannerX = LANDSCAPE_BANNER_X;
        bannerY = LANDSCAPE_BANNER_Y;
        bannerHorizontalMargin = LANDSCAPE_BANNER_HORIZONTAL_MARGIN;
        bannerVerticalMargin = LANDSCAPE_BANNER_VERTICAL_MARGIN;
        appNameLabelXOffset = APP_NAME_LABEL_LANDSCAPE_X_OFFSET;
        appNameLabelYOffset = APP_NAME_LABEL_LANDSCAPE_Y_OFFSET;
        publisherNameLabelXOffset = PUBLISHER_NAME_LABEL_LANDSCAPE_X_OFFSET;
        publisherNameLabelYOffset = PUBLISHER_NAME_LABEL_LANDSCAPE_Y_OFFSET;
        priceLabelXOffset = PRICE_LABEL_LANDSCAPE_X_OFFSET;
        priceLabelYOffset = PRICE_LABEL_LANDSCAPE_Y_OFFSET;
        cornerRadius = LANDSCAPE_VIEW_CORNER_RADIUS;
        labelWidth = LANDSCAPE_LABEL_WIDTH;
    }
    
    if(countState==1)
    {
        [self.view setFrame:CGRectMake(0, height-BannerHeight, width, BannerHeight)];
    }
    
    // scroll view
    self.ContainerView.frame = CGRectMake(0, 0, width, BannerHeight);
    
    // background image view
    self.BannerBackgroundImageView.frame = CGRectMake(0, 0, width, BannerHeight);
    [self.BannerBackgroundImageView setImage:imgToUse];
    
    // banner button to handle click
    self.BannerButton.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
    
    // labels
    appNameLabel.frame = CGRectMake(BannerHeight+appNameLabelXOffset,appNameLabelYOffset, labelWidth, BannerHeight);
    publisherNameLabel.frame =
    CGRectMake(BannerHeight+publisherNameLabelXOffset, publisherNameLabelYOffset, labelWidth, BannerHeight);
    priceLabel.frame = CGRectMake(BannerHeight+priceLabelXOffset, priceLabelYOffset,labelWidth,BannerHeight);
    
    // actual banner image view
    self.BannerImageView.frame =
    CGRectMake(bannerX, bannerY, BannerHeight-bannerHorizontalMargin, BannerHeight-bannerVerticalMargin);
    self.BannerImageView.layer.cornerRadius = cornerRadius;
    self.BannerImageView.clipsToBounds = YES;
}

// changeBannerImage
-(void)changeBannerImage
{
    [self runAnimation];
    
    NSString* publisherName = [jsonarray[Countad] objectForKey:@"trackName"];
    NSString* price = [NSString stringWithFormat:@"%@ - On the App Store", [jsonarray[Countad] objectForKey:@"formattedPrice"]];
    
    appNameLabel.text = publisherName;
    priceLabel.text = price;
    
    [self.BannerImageView setImage:self.BannerImages[Countad-1]];
    
    [UIView commitAnimations];
}

// runAnimation
-(void)runAnimation
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelay:0];
    
    int Number = arc4random() % 4;
    switch (Number) {
        case 0:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                                   forView:self.ContainerView
                                     cache:YES];
            
            
            break;
        case 1:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                   forView:self.ContainerView
                                     cache:YES];
            
            break;
        case 2:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                   forView:self.ContainerView
                                     cache:YES];
            
            break;
        case 3:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                                   forView:self.ContainerView
                                     cache:YES];
            
            break;
        default:
            break;
    }
}

@end

// constants
const int MAX_BANNERS = 5;
const int BANNER_SWAP_DELAY_IN_SECS = 3;

const int PORTRAIT_BANNER_X = 2;
const int PORTRAIT_BANNER_Y = 4;
const int PORTRAIT_BANNER_HORIZONTAL_MARGIN = 6;
const int PORTRAIT_BANNER_VERTICAL_MARGIN = 6;
const int APP_NAME_LABEL_PORTRAIT_X_OFFSET = 8;
const int APP_NAME_LABEL_PORTRAIT_Y_OFFSET = -12;
const int PUBLISHER_NAME_LABEL_PORTRAIT_X_OFFSET = 15;
const int PUBLISHER_NAME_LABEL_PORTRAIT_Y_OFFSET = 0;
const int PRICE_LABEL_PORTRAIT_X_OFFSET = 23;
const int PRICE_LABEL_PORTRAIT_Y_OFFSET = 11;
const int PORTRAIT_LABEL_WIDTH = 180;
const int PORTRAIT_VIEW_CORNER_RADIUS = 11;

const int LANDSCAPE_BANNER_X = 6;
const int LANDSCAPE_BANNER_Y = 2;
const int LANDSCAPE_BANNER_HORIZONTAL_MARGIN = 4;
const int LANDSCAPE_BANNER_VERTICAL_MARGIN = 4;
const int APP_NAME_LABEL_LANDSCAPE_X_OFFSET = 18;
const int APP_NAME_LABEL_LANDSCAPE_Y_OFFSET = -10;
const int PUBLISHER_NAME_LABEL_LANDSCAPE_X_OFFSET = 25;
const int PUBLISHER_NAME_LABEL_LANDSCAPE_Y_OFFSET = 1;
const int PRICE_LABEL_LANDSCAPE_X_OFFSET = 33;
const int PRICE_LABEL_LANDSCAPE_Y_OFFSET = 10;
const int LANDSCAPE_LABEL_WIDTH = 180;
const int LANDSCAPE_VIEW_CORNER_RADIUS = 5;