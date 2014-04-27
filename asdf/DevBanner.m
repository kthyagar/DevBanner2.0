//
//  DevBanner.m
//
//  Created by Nick Culbertson on 2/22/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import "DevBanner.h"

@implementation DevBanner

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define AppStoreURLFormat @"itms-apps://itunes.apple.com/app/id";

/// hide
- (void)hide
{
    countState=2;
    someScrollView1.hidden=YES;
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
        someScrollView1.hidden=NO;
        [self bannerArrange];
        [self userActionOn];
        
        return;
    }
    else if(countState==3)
    {
        countState=1;
        someScrollView1.hidden=NO;
        [self bannerArrange];
        [self userActionOn];
        
        [self swap1];
        
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
            
            [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data2 waitUntilDone:YES];
        });
    }
    else
    {
        NSLog(@"JSON Reuse");
        
        Countnetwork=1;
        
        jsonarray = [[NSUserDefaults standardUserDefaults] objectForKey:@"DevBannerJSON"];
        
        NSString* string2= [jsonarray[0] objectForKey:@"artistName"];
        NSString* string1= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppName1"];
        NSString* string3= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppPrice1"];
        
        NSString* string4= [[NSUserDefaults standardUserDefaults] objectForKey:@"StoreLink1"];
        NSLog(@"%@",string1);
        NSLog(@"%@",string2);
        NSLog(@"%@",string3);
        NSLog(@"%@",string4);
        
        label1a = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+8,-12, 180, BannerHeight)];
        label2a = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+15,0, 180, BannerHeight)];
        label3a = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+23,11, 180, BannerHeight)];
        
        label1a.text=string1;
        label2a.text=string2;
        label3a.text=string3;
        
        [label1a setFont:[UIFont systemFontOfSize:11]];
        [label2a setFont:[UIFont systemFontOfSize:8]];
        [label3a setFont:[UIFont systemFontOfSize:8]];
        
        NSLog(@"%@",_AppID);
        
        numObjectsP = [jsonarray count]-1;
        
        Countdelay = 10;
        
        [self showAd];
    }
}

/// fetchedData
- (void)fetchedData:(NSData *)responseData
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
        
        [self show2];
    }
}

/// bannerArrange
- (void)bannerArrange
{
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
        
        if(countState == 1)
        {
            [self.view setFrame:CGRectMake(0,[[UIScreen mainScreen] bounds].size.height-BannerHeight, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
        }
        
        someScrollView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        
        ImageView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        [ImageView1 setImage:img1];
        
        someImageView1.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        someImageView2.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        someImageView3.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        someImageView4.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        someImageView5.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        
        someButtonView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        someButtonView2.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        someButtonView3.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        someButtonView4.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        someButtonView5.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        
        label1a.frame = CGRectMake(BannerHeight+8,-12, 180, BannerHeight);
        label2a.frame = CGRectMake(BannerHeight+15,0, 180, BannerHeight);
        label3a.frame = CGRectMake(BannerHeight+23,11, 180, BannerHeight);
        
        [label1a setFont:[UIFont systemFontOfSize:11]];
        [label2a setFont:[UIFont systemFontOfSize:8]];
        [label3a setFont:[UIFont systemFontOfSize:8]];
        
        //
        //
        someImageView1.layer.cornerRadius = 11;
        someImageView1.clipsToBounds = YES;
        someImageView2.layer.cornerRadius = 11;
        someImageView2.clipsToBounds = YES;
        someImageView3.layer.cornerRadius = 11;
        someImageView3.clipsToBounds = YES;
        someImageView4.layer.cornerRadius = 11;
        someImageView4.clipsToBounds = YES;
        someImageView5.layer.cornerRadius = 11;
        someImageView5.clipsToBounds = YES;
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
        
        if(countState==1)
        {
            [self.view setFrame:CGRectMake(0,[[UIScreen mainScreen] bounds].size.width-BannerHeight, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
        }
        
        someScrollView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        
        ImageView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        [ImageView1 setImage:img1L];
        
        someImageView1.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        someImageView2.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        someImageView3.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        someImageView4.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        someImageView5.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        
        someButtonView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        someButtonView2.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        someButtonView3.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        someButtonView4.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        someButtonView5.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        
        label1a.frame = CGRectMake(BannerHeight+18,-10, 180, BannerHeight);
        label2a.frame = CGRectMake(BannerHeight+25,1, 180, BannerHeight);
        label3a.frame = CGRectMake(BannerHeight+33,10, 180, BannerHeight);
        
        [label1a setFont:[UIFont systemFontOfSize:10]];
        [label2a setFont:[UIFont systemFontOfSize:8]];
        [label3a setFont:[UIFont systemFontOfSize:8]];
        
        someImageView1.layer.cornerRadius = 5;
        someImageView1.clipsToBounds = YES;
        someImageView2.layer.cornerRadius = 5;
        someImageView2.clipsToBounds = YES;
        someImageView3.layer.cornerRadius = 5;
        someImageView3.clipsToBounds = YES;
        someImageView4.layer.cornerRadius = 5;
        someImageView4.clipsToBounds = YES;
        someImageView5.layer.cornerRadius = 5;
        someImageView5.clipsToBounds = YES;
    }
    
}

/// show2
- (void)show2
{
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
    
    dispatch_async(kBgQueue, ^{
        NSString *stringBuilder = @"https://itunes.apple.com/lookup?id=";
        stringBuilder = [stringBuilder stringByAppendingString:_CampaignID];
        NSLocale *locale = [NSLocale currentLocale];
        stringBuilder = [stringBuilder stringByAppendingString:@"&entity=software&country="];
        
        stringBuilder = [stringBuilder stringByAppendingString:[locale objectForKey: NSLocaleCountryCode]];
        NSLog(@"%@",stringBuilder);
        
        NSURL* kjsonURL = [NSURL URLWithString:stringBuilder];
        
        NSData* data2 = [NSData dataWithContentsOfURL:kjsonURL];
        
        [self performSelectorOnMainThread:@selector(fetchedData2:) withObject:data2 waitUntilDone:YES];
    });
}

/// fetchedData2
- (void)fetchedData2:(NSData *)responseData
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
        
        NSString* string2= [jsonarray[0] objectForKey:@"artistName"];
        NSString* string1= [jsonarray[1] objectForKey:@"trackName"];
        
        NSString* string3=[NSString stringWithFormat:@"%@ - On the App Store", [jsonarray[1] objectForKey:@"formattedPrice"]];
        
        NSString* string4= [jsonarray[1] objectForKey:@"trackId"];
        NSLog(@"%@",string1);
        NSLog(@"%@",string2);
        NSLog(@"%@",string3);
        NSLog(@"%@",string4);
        
        label1a = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+8,0-BannerHeight*.25, 180, BannerHeight)];
        label2a = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+15,0, 180, BannerHeight)];
        label3a = [[UILabel alloc] initWithFrame:CGRectMake(BannerHeight+23,0+BannerHeight*.22, 180, BannerHeight)];
        
        label1a.text=string1;
        label2a.text=string2;
        label3a.text=string3;
        
        [label1a setFont:[UIFont systemFontOfSize:10]];
        [label2a setFont:[UIFont systemFontOfSize:8]];
        [label3a setFont:[UIFont systemFontOfSize:8]];
        
        NSLog(@"%@",_AppID);
        //   ⭐🌟
        
        NSLog(@"%@",jsonarray);//
        
        if(jsonarray==NULL)
        {
            NSLog(@"JSON Object Not There");
            
            return;
        }
        else
        {
            numObjectsP = [jsonarray count]-1;
            
            NSLog(@"This is the Number %lu",(unsigned long)numObjectsP);
            
            Countdelay = 10;
            
            NSLog(@"JSON GET SUCCESS");
            defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setValue:jsonarray forKey:@"DevBannerJSON"];
            
            [defaults synchronize];
            
            //Versioning Here
            [self showAd];
            
        }
    }
}

/// showAd
- (void)showAd
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
    
    if(numObjectsP>=5)
    {
        Countmax=6;
    }
    
    int i = 1;
    int j = 1;
    NSMutableArray *images = [NSMutableArray array];
    while(j <= Countmax)
    {
        if (numObjectsP<i) {
            j++;
            NSLog(@"Last Banner");
            continue;
        }
        NSString *storelink = [NSString stringWithFormat:@"StoreLink%d", j];
        NSString *appname = [NSString stringWithFormat:@"AppName%d", j];
        NSString *appprice = [NSString stringWithFormat:@"AppPrice%d", j];
        NSString *filename = [NSString stringWithFormat:@"/Ad_%dP.png", j];
        NSString* string= [jsonarray[i] objectForKey:@"kind"];
        NSString* string1= [NSString stringWithFormat:@"%@",[jsonarray[i] objectForKey:@"price"]];
        
        NSString* string2= [jsonarray[i] objectForKey:@"trackName"];
        NSString* string3=[NSString stringWithFormat:@"%@ - On the App Store", [jsonarray[i] objectForKey:@"formattedPrice"]];
        
        NSLog(@"I Am The Number %@",string);
        NSLog(@"I Am The Number %@",string2);
        
        if([string isEqualToString:@"mac-software"]){
            NSLog(@"Mac App Skipped");
            
            i++;
            numObjectsP--;
            NSLog(@"I Am The Number %lu",(unsigned long)numObjectsP);
            continue;
        }
        
        if([string1 isEqualToString:@"0"]&&[_AppType isEqualToString:@"PAID"]){
            NSLog(@"Free App Skipped");
            
            i++;
            numObjectsP--;
            NSLog(@"I Am The Number %lu",(unsigned long)numObjectsP);
            continue;
        }
        
        if(![string1 isEqualToString:@"0"]&&[_AppType isEqualToString:@"FREE"]){
            NSLog(@"Paid App Skipped");
            
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
            NSString *imagePath1P = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:filename];
            [imageData1P writeToFile:imagePath1P atomically:YES];
            [defaults setValue:urlBuilder1 forKey:storelink];//
            [defaults setValue:string2 forKey:appname];
            [defaults setValue:string3 forKey:appprice];
            [defaults synchronize];
        }
        
        NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:filename];
        
        [images addObject:[UIImage imageWithContentsOfFile:getImagePath]];
        
        i++;
        j++;
    }
    
    if(numObjectsP!=0){
        if(Countnetwork==1){
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
        }
        
        NSString *getImagePath1 = [documentsDirectory stringByAppendingPathComponent:@"/Ad_Image_1.png"];
        img1 = [UIImage imageWithContentsOfFile:getImagePath1];
        
        NSString *getImagePath2 = [documentsDirectory stringByAppendingPathComponent:@"/Ad_Image_2.png"];
        img1L = [UIImage imageWithContentsOfFile:getImagePath2];
    }
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationPortrait)
    {
        NSLog(@"UP");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            BannerHeight=50;
        }
        else
        {
            BannerHeight=66;
        }
        
        someButtonView1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someButtonView2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someButtonView3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someButtonView4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someButtonView5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        ImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
        [ImageView1 setImage:img1];
        
        someImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        someImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        someImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        someImageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        someImageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        
        someButtonView1 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
        someButtonView2 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
        someButtonView3 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
        someButtonView4 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
        someButtonView5 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
        
        [someButtonView1 addTarget:self action:@selector(ad1) forControlEvents:UIControlEventTouchUpInside];
        [someButtonView2 addTarget:self action:@selector(ad2) forControlEvents:UIControlEventTouchUpInside];
        [someButtonView3 addTarget:self action:@selector(ad3) forControlEvents:UIControlEventTouchUpInside];
        [someButtonView4 addTarget:self action:@selector(ad4) forControlEvents:UIControlEventTouchUpInside];
        [someButtonView5 addTarget:self action:@selector(ad5) forControlEvents:UIControlEventTouchUpInside];
        
        someScrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
        
        
        [someScrollView1 setBackgroundColor:[UIColor colorWithWhite:.2 alpha:.9]];
        
        
        [someScrollView1 setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
        
        NSUInteger numImg = [images count];
        
        if (numImg==0) {
            return;
        }
        
        if(numImg>=1) {
            [someImageView1 setImage:images[0]];
        }
        
        if(numImg>=2) {
            [someImageView2 setImage:images[1]];
        }
        
        if(numImg>=3) {
            [someImageView3 setImage:images[2]];
        }
        
        if(numImg>=4) {
            [someImageView4 setImage:images[3]];
        }
        
        if(numImg>=5) {
            [someImageView5 setImage:images[4]];
        }
    }
    else
    {
        NSLog(@"DOWN");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            BannerHeight=50;
            
            //32   This is Landscape
        }else{
            BannerHeight=66;
            //90 Admob
        }
        
        
        someButtonView1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someButtonView2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someButtonView3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someButtonView4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someButtonView5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        ImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
        
        someImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        someImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        someImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        someImageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        someImageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(2,4, BannerHeight-6, BannerHeight-6)];
        
        someButtonView1 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
        someButtonView2 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
        someButtonView3 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
        someButtonView4 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
        someButtonView5 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
        
        [someButtonView1 addTarget:self action:@selector(ad1) forControlEvents:UIControlEventTouchUpInside];
        [someButtonView2 addTarget:self action:@selector(ad2) forControlEvents:UIControlEventTouchUpInside];
        [someButtonView3 addTarget:self action:@selector(ad3) forControlEvents:UIControlEventTouchUpInside];
        [someButtonView4 addTarget:self action:@selector(ad4) forControlEvents:UIControlEventTouchUpInside];
        [someButtonView5 addTarget:self action:@selector(ad5) forControlEvents:UIControlEventTouchUpInside];
        
        someScrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
        
        [someScrollView1 setBackgroundColor:[UIColor colorWithWhite:.2 alpha:.9]];
        
        [someScrollView1 setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
        
        [ImageView1 setImage:img1];
        
        NSUInteger numImg = [images count];
        if (numImg==0) {
            return;
        }
        
        if(numImg>=1) {
            [someImageView1 setImage:images[0]];
        }
        
        if(numImg>=2) {
            [someImageView2 setImage:images[1]];
        }
        
        if(numImg>=3) {
            [someImageView3 setImage:images[2]];
        }
        
        if(numImg>=4) {
            [someImageView4 setImage:images[3]];
        }
        
        if(numImg>=5) {
            [someImageView5 setImage:images[4]];
        }
    }
    
    [self bannerArrange];
    
    [self.view addSubview:someScrollView1];
    [self userActionOn];
    Countad=0;
    Countmode=1;
    [self swap1];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(handleOrientationChangeNotification:) name: UIDeviceOrientationDidChangeNotification object: nil];
}

/// handleOrientationChangeNotification
-(void)handleOrientationChangeNotification:(NSNotification *)notification
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationPortrait) {
        NSLog(@"PORT");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            BannerHeight=50;
            
            //32   This is Landscape
        }else{
            BannerHeight=66;
            //90 Admob
        }
        
        if(countState==1)
        {
            [self.view setFrame:CGRectMake(0,[[UIScreen mainScreen] bounds].size.height-BannerHeight, [[UIScreen mainScreen] bounds].size.width, BannerHeight)];
            
        }
        
        someScrollView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        
        ImageView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        [ImageView1 setImage:img1];
        
        someImageView1.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        someImageView2.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        someImageView3.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        someImageView4.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        someImageView5.frame = CGRectMake(2,4, BannerHeight-6, BannerHeight-6);
        
        someButtonView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        someButtonView2.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        someButtonView3.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        someButtonView4.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        someButtonView5.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, BannerHeight);
        
        
        label1a.frame = CGRectMake(BannerHeight+8,-12, 180, BannerHeight);
        label2a.frame = CGRectMake(BannerHeight+15,0, 180, BannerHeight);
        label3a.frame = CGRectMake(BannerHeight+23,11, 180, BannerHeight);
        
        [label1a setFont:[UIFont systemFontOfSize:11]];
        [label2a setFont:[UIFont systemFontOfSize:8]];
        [label3a setFont:[UIFont systemFontOfSize:8]];
        
        //
        //
        someImageView1.layer.cornerRadius = 11;
        someImageView1.clipsToBounds = YES;
        someImageView2.layer.cornerRadius = 11;
        someImageView2.clipsToBounds = YES;
        someImageView3.layer.cornerRadius = 11;
        someImageView3.clipsToBounds = YES;
        someImageView4.layer.cornerRadius = 11;
        someImageView4.clipsToBounds = YES;
        someImageView5.layer.cornerRadius = 11;
        someImageView5.clipsToBounds = YES;
        
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
        
        if(countState==1)
        {
            //  [self.view setFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
            [self.view setFrame:CGRectMake(0,[[UIScreen mainScreen] bounds].size.width-BannerHeight, [[UIScreen mainScreen] bounds].size.height, BannerHeight)];
            
            
        }
        someScrollView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        
        ImageView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        [ImageView1 setImage:img1L];
        
        someImageView1.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        someImageView2.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        someImageView3.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        someImageView4.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        someImageView5.frame = CGRectMake(6,2, BannerHeight-4, BannerHeight-4);
        
        someButtonView1.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        someButtonView2.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        someButtonView3.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        someButtonView4.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        someButtonView5.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, BannerHeight);
        
        label1a.frame = CGRectMake(BannerHeight+18,-10, 180, BannerHeight);
        label2a.frame = CGRectMake(BannerHeight+25,1, 180, BannerHeight);
        label3a.frame = CGRectMake(BannerHeight+33,10, 180, BannerHeight);
        
        
        [label1a setFont:[UIFont systemFontOfSize:10]];
        [label2a setFont:[UIFont systemFontOfSize:8]];
        [label3a setFont:[UIFont systemFontOfSize:8]];
        
        someImageView1.layer.cornerRadius = 5;
        someImageView1.clipsToBounds = YES;
        someImageView2.layer.cornerRadius = 5;
        someImageView2.clipsToBounds = YES;
        someImageView3.layer.cornerRadius = 5;
        someImageView3.clipsToBounds = YES;
        someImageView4.layer.cornerRadius = 5;
        someImageView4.clipsToBounds = YES;
        someImageView5.layer.cornerRadius = 5;
        someImageView5.clipsToBounds = YES;
    }
}

-(void)ad1{
    NSLog(@"Press 1");
    
    NSString* string = [[NSUserDefaults standardUserDefaults] objectForKey:@"StoreLink1"];
    NSURL *url = [NSURL URLWithString:string];
    NSLog(@"%@",url);
    [[UIApplication sharedApplication]  openURL:url];
    
}
-(void)ad2{
    NSLog(@"Press 2");
    NSString* string = [[NSUserDefaults standardUserDefaults] objectForKey:@"StoreLink2"];
    NSURL *url = [NSURL URLWithString:string];
    NSLog(@"%@",url);
    [[UIApplication sharedApplication]  openURL:url];
    
}
-(void)ad3{
    NSLog(@"Press 3");
    NSString* string = [[NSUserDefaults standardUserDefaults] objectForKey:@"StoreLink3"];
    NSURL *url = [NSURL URLWithString:string];
    NSLog(@"%@",url);
    [[UIApplication sharedApplication]  openURL:url];
    
}
-(void)ad4{
    NSLog(@"Press 4");
    NSString* string = [[NSUserDefaults standardUserDefaults] objectForKey:@"StoreLink4"];
    NSURL *url = [NSURL URLWithString:string];
    NSLog(@"%@",url);
    [[UIApplication sharedApplication]  openURL:url];
    
}
-(void)ad5{
    NSLog(@"Press 5");
    NSString* string = [[NSUserDefaults standardUserDefaults] objectForKey:@"StoreLink5"];
    NSURL *url = [NSURL URLWithString:string];
    NSLog(@"%@",url);
    [[UIApplication sharedApplication]  openURL:url];
    
}

-(void)swap1
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
    [someScrollView1 setBackgroundColor:[UIColor colorWithRed:value/255.0 green:value1/255.0  blue:value2/255.0 alpha:value3]];
    
    // Banner Flips
    
    Countad++;
    
    NSLog(@"Port it");
    if(numObjectsP<=1){
        Countad=0;
    }
    if(numObjectsP==2){
        if(Countad==3){
            Countad=1;
        }
    }
    if(numObjectsP==3){
        if(Countad==4){
            Countad=1;
        }
    }
    if(numObjectsP==4){
        if(Countad==5){
            Countad=1;
        }
    }
    if(numObjectsP>=5){
        if(Countad==6){
            Countad=1;
        }
    }
    
    if(Countad==0)
    {
    }
    else if(Countad==1)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.5];
        [UIView setAnimationDelay:0];
        
        int Number = arc4random() % 4;
        switch (Number) {
            case 0:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                                       forView:someScrollView1
                                         cache:YES];
                
                
                break;
            case 1:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 2:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 3:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            default:
                break;
        }
        
        [ImageView1 removeFromSuperview];
        [someImageView2 removeFromSuperview];
        [someImageView3 removeFromSuperview];
        [someImageView4 removeFromSuperview];
        [someImageView5 removeFromSuperview];
        
        [someButtonView2 removeFromSuperview];
        [someButtonView3 removeFromSuperview];
        [someButtonView4 removeFromSuperview];
        [someButtonView5 removeFromSuperview];
        
        [label1a removeFromSuperview];
        [label2a removeFromSuperview];
        [label3a removeFromSuperview];
        
        
        [label1a setTextColor:[UIColor whiteColor]];
        [label2a setTextColor:[UIColor whiteColor]];
        
        [label3a setTextColor:[UIColor whiteColor]];
        
        label1a.shadowColor =[UIColor colorWithWhite:0 alpha:.8];
        label1a.shadowOffset = CGSizeMake(1,1);
        label2a.shadowColor =[UIColor colorWithWhite:0 alpha:.8];
        label2a.shadowOffset = CGSizeMake(1,1);
        label3a.shadowColor =[UIColor colorWithWhite:0 alpha:.8];
        label3a.shadowOffset = CGSizeMake(1,1);
        
        [someScrollView1 addSubview:ImageView1];
        
        [someScrollView1 addSubview:label1a];
        [someScrollView1 addSubview:label2a];
        [someScrollView1 addSubview:label3a];
        
        NSString* string1= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppName1"];
        NSString* string3= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppPrice1"];
        
        label1a.text=string1;
        label3a.text=string3;
        
        
        [someScrollView1 addSubview:someImageView1];
        [someScrollView1 addSubview:someButtonView1];
        
        [UIView commitAnimations];
        
        
    }else if(Countad==2){
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.5];
        [UIView setAnimationDelay:0];
        
        
        int Number = arc4random() % 4;
        switch (Number) {
            case 0:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                                       forView:someScrollView1
                                         cache:YES];
                
                
                break;
            case 1:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 2:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 3:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            default:
                break;
        }
        [ImageView1 removeFromSuperview];
        [someImageView1 removeFromSuperview];
        [someScrollView1 addSubview:ImageView1];
        [someButtonView1 removeFromSuperview];
        
        [label1a removeFromSuperview];
        [label2a removeFromSuperview];
        [label3a removeFromSuperview];
        
        [someScrollView1 addSubview:someImageView2];
        [someScrollView1 addSubview:someButtonView2];
        
        [someScrollView1 addSubview:label1a];
        [someScrollView1 addSubview:label2a];
        [someScrollView1 addSubview:label3a];
        
        NSString* string1= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppName2"];
        NSString* string3= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppPrice2"];
        
        label1a.text=string1;
        label3a.text=string3;
        
        [UIView commitAnimations];
        
        
    }else if(Countad==3){
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.5];
        [UIView setAnimationDelay:0];
        
        int Number = arc4random() % 4;
        switch (Number) {
            case 0:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                                       forView:someScrollView1
                                         cache:YES];
                
                
                break;
            case 1:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 2:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 3:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            default:
                break;
        }
        [ImageView1 removeFromSuperview];
        [someButtonView2 removeFromSuperview];
        
        [someImageView2 removeFromSuperview];
        [someScrollView1 addSubview:ImageView1];
        
        [label1a removeFromSuperview];
        [label2a removeFromSuperview];
        [label3a removeFromSuperview];
        
        [someScrollView1 addSubview:someImageView3];
        [someScrollView1 addSubview:someButtonView3];
        
        
        [someScrollView1 addSubview:label1a];
        [someScrollView1 addSubview:label2a];
        [someScrollView1 addSubview:label3a];
        
        NSString* string1= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppName3"];
        NSString* string3= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppPrice3"];
        
        label1a.text=string1;
        label3a.text=string3;
        
        [UIView commitAnimations];
        
    }else if(Countad==4){
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.5];
        [UIView setAnimationDelay:0];
        
        int Number = arc4random() % 4;
        switch (Number) {
            case 0:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                                       forView:someScrollView1
                                         cache:YES];
                
                
                break;
            case 1:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 2:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 3:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            default:
                break;
        }
        [ImageView1 removeFromSuperview];
        [someButtonView3 removeFromSuperview];
        
        [someImageView3 removeFromSuperview];
        [someScrollView1 addSubview:ImageView1];
        
        [label1a removeFromSuperview];
        [label2a removeFromSuperview];
        [label3a removeFromSuperview];
        
        [someScrollView1 addSubview:someImageView4];
        [someScrollView1 addSubview:someButtonView4];
        
        
        [someScrollView1 addSubview:label1a];
        [someScrollView1 addSubview:label2a];
        [someScrollView1 addSubview:label3a];
        
        NSString* string1= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppName4"];
        NSString* string3= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppPrice4"];
        
        label1a.text=string1;
        label3a.text=string3;
        
        [UIView commitAnimations];
        
    }else if(Countad==5){
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.5];
        [UIView setAnimationDelay:0];
        
        int Number = arc4random() % 4;
        switch (Number) {
            case 0:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                                       forView:someScrollView1
                                         cache:YES];
                
                
                break;
            case 1:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 2:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            case 3:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                                       forView:someScrollView1
                                         cache:YES];
                
                break;
            default:
                break;
        }
        [ImageView1 removeFromSuperview];
        
        [someImageView4 removeFromSuperview];
        [someButtonView4 removeFromSuperview];
        
        [someScrollView1 addSubview:ImageView1];
        
        [label1a removeFromSuperview];
        [label2a removeFromSuperview];
        [label3a removeFromSuperview];
        
        [someScrollView1 addSubview:someImageView5];
        [someScrollView1 addSubview:someButtonView5];
        
        
        [someScrollView1 addSubview:label1a];
        [someScrollView1 addSubview:label2a];
        [someScrollView1 addSubview:label3a];
        
        NSString* string1= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppName5"];
        NSString* string3= [[NSUserDefaults standardUserDefaults] objectForKey:@"AppPrice5"];
        
        label1a.text=string1;
        label3a.text=string3;
        
        [UIView commitAnimations];
        
    }
    
    //Add +1 to view count
    [self performSelector:@selector(swap1) withObject:nil afterDelay:Countdelay];
}


@end