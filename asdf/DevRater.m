//
//  DevRater.m
//  asdf
//
//  Created by Nick Culbertson on 4/16/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import "DevRater.h"

@implementation DevRater

- (void)show{
    someScrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    ImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [ImageView1 setBackgroundColor:[UIColor blackColor]];
    ImageView1.alpha=.5;
    
    ImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.1,[[UIScreen mainScreen] bounds].size.height*.2, [[UIScreen mainScreen] bounds].size.width*.8, 250)];
    [ImageView2 setBackgroundColor:[UIColor darkGrayColor]];
    ImageView2.layer.cornerRadius = 17;
    ImageView2.clipsToBounds = YES;
    
    ImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.1+4,[[UIScreen mainScreen] bounds].size.height*.2+4, [ImageView2 bounds].size.width-8, 200)];
    [ImageView3 setBackgroundColor:[UIColor lightGrayColor]];
    ImageView3.alpha=.5;
    ImageView3.layer.cornerRadius = 13;
    ImageView3.clipsToBounds = YES;
    
    UIImageView * myImageView = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.5-38,[[UIScreen mainScreen] bounds].size.height*.2+36, 76, 76)];
    
    self.applicationIcon = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"];
    myImageView.image = [UIImage imageNamed:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"]];
    NSLog(@"%@",self.applicationIcon);
    if (self.applicationIcon==nil)
    {
        myImageView.image = [UIImage imageNamed:@"Icon.png"];
        NSLog(@"No Icon");
    }
    
    myImageView.layer.cornerRadius = 17;
    myImageView.clipsToBounds = YES;
    
    label1a = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.1+4,[[UIScreen mainScreen] bounds].size.height*.2+11, [ImageView2 bounds].size.width-8, 20)];
    label2a = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.1+4,250, [ImageView2 bounds].size.width-8, 20)];
    label3a = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.5-38,[[UIScreen mainScreen] bounds].size.height*.2+24, 76, 76)];
    
    label2a.numberOfLines = 3;
    
    label2a.frame = CGRectMake(
                               label2a.frame.origin.x, label2a.frame.origin.y,
                               label2a.frame.size.width, label2a.frame.size.height*3);
    
    [label1a setTextColor:[UIColor whiteColor]];
    [label2a setTextColor:[UIColor whiteColor]];
    
    label1a.shadowColor =[UIColor colorWithWhite:0 alpha:.8];
    label1a.shadowOffset = CGSizeMake(1,1);
    label2a.shadowColor =[UIColor colorWithWhite:0 alpha:.5];
    label2a.shadowOffset = CGSizeMake(1,1);
    
    
    star1 = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.5-123,316, 46, 46)];
    star2 = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.5-73,316, 46, 46)];
    
    star3 = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.5-23,316, 46, 46)];
    
    star4 = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.5+27,316, 46, 46)];
    star5 = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.5+77,316, 46, 46)];
    [star1 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    
    [star1 addTarget:self action:@selector(star1press) forControlEvents:UIControlEventTouchUpInside];
    [star2 addTarget:self action:@selector(star2press) forControlEvents:UIControlEventTouchUpInside];
    [star3 addTarget:self action:@selector(star3press) forControlEvents:UIControlEventTouchUpInside];
    [star4 addTarget:self action:@selector(star4press) forControlEvents:UIControlEventTouchUpInside];
    [star5 addTarget:self action:@selector(star5press) forControlEvents:UIControlEventTouchUpInside];
    star1.alpha=.5;
    star2.alpha=.5;
    star3.alpha=.5;
    star4.alpha=.5;
    star5.alpha=.5;
    
    
    self.applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if ([self.applicationName length] == 0)
    {
        self.applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
        
    }
    
    label1a.text=self.applicationName;
    label2a.text=[NSString stringWithFormat: @"Tell us how much you enjoy using %@." , _applicationName];
    //    label3a.text=string3;
    
    [label1a setFont:[UIFont systemFontOfSize:15]];
    [label2a setFont:[UIFont systemFontOfSize:12]];
    [label3a setFont:[UIFont systemFontOfSize:9]];
    
    //[label1a setTextAlignment:UITextAlignmentCenter];
    label1a.textAlignment = NSTextAlignmentCenter;
    label2a.textAlignment = NSTextAlignmentCenter;
    
    
    [self.view addSubview:someScrollView1];
    someScrollView1.alpha=0;
    [someScrollView1 addSubview:ImageView1];
    [someScrollView1 addSubview:ImageView2];
    [someScrollView1 addSubview:ImageView3];
    [someScrollView1 addSubview:myImageView];
    [someScrollView1 addSubview:label1a];
    [someScrollView1 addSubview:label2a];
    [someScrollView1 addSubview:label3a];
    [someScrollView1 addSubview:star1];
    [someScrollView1 addSubview:star2];
    
    [someScrollView1 addSubview:star3];
    [someScrollView1 addSubview:star4];
    
    [someScrollView1 addSubview:star5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                           forView:someScrollView1
                             cache:YES];
    
    someScrollView1.alpha=1;
    
    
    [UIView commitAnimations];
    
    
    
    
    
    
}

- (void)star1press{
    // [someScrollView1 performSelectorOnMainThread:@selector(removeFromSuperview) withObject:nil waitUntilDone:NO];
    
    // UIView *view = [self viewWithTag:111];
    //self.view.frame=CGRectMake(0,0, 0, 0)];
    //[self.vie removeFromSuperview];
    
    //  UIView *removeView;
    [self.view removeFromSuperview];
    
    
    star1.alpha=1;
    star2.alpha=.5;
    star3.alpha=.5;
    star4.alpha=.5;
    star5.alpha=.5;
    label2a.text=@"EMAIL SUPPORT";
    
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
}
- (void)star2press{
    star1.alpha=1;
    star2.alpha=1;
    star3.alpha=.5;
    star4.alpha=.5;
    star5.alpha=.5;
    label2a.text=@"EMAIL SUPPORT";
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
}
- (void)star3press{
    star1.alpha=1;
    star2.alpha=1;
    star3.alpha=1;
    star4.alpha=.5;
    star5.alpha=.5;
    label2a.text=@"Great! Would you mind leaving a positive review or rating in the App Store? It's really appreciated!";
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
}
- (void)star4press{
    star1.alpha=1;
    star2.alpha=1;
    star3.alpha=1;
    star4.alpha=1;
    star5.alpha=.5;
    label2a.text=@"Great! Would you mind taking a moment to rate it? It really does help. Thanks for your support!";
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
}
- (void)star5press{
    star1.alpha=1;
    star2.alpha=1;
    star3.alpha=1;
    star4.alpha=1;
    star5.alpha=1;
    label2a.text=@"Excellent! Would you mind taking a moment to leave a nice review? It really does help. Thanks for your support!";
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
