//
//  DevRater.m
//  asdf
//
//  Created by Nick Culbertson on 4/16/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import "DevRater.h"
#import "CustomAlertView.h"

@implementation DevRater

- (void)show2{
    
    CountStar=0;
    
    someScrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    someScrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(15,[[UIScreen mainScreen] bounds].size.height*.5-110, 290, 320)];

    ImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [ImageView1 setBackgroundColor:[UIColor blackColor]];
    ImageView1.alpha=.5;
    
    ImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, [someScrollView2 bounds].size.width, 200)];
    [ImageView2 setBackgroundColor:[UIColor lightGrayColor]];
    ImageView2.layer.cornerRadius = 17;
    ImageView2.clipsToBounds = YES;
    
    ImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(2,0+2, [someScrollView2 bounds].size.width-4, 196)];
    [ImageView3 setBackgroundColor:[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:1.0f]];
    ImageView3.alpha=1;
    ImageView3.layer.cornerRadius = 15;
    ImageView3.clipsToBounds = YES;
  
    ImageView2b = [[UIImageView alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-35,29, 76, 76)];
    [ImageView2b setBackgroundColor:[UIColor lightGrayColor]];
    ImageView2b.alpha=.4;
    ImageView2b.layer.cornerRadius = 18;
    ImageView2b.clipsToBounds = YES;
    
    myImageView = [[UIImageView alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-38,26, 76, 76)];
    
    
    [ImageView3 setBackgroundColor:[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:1.0f]];
    
    [ImageView3 setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0f]];
    
    
    
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
    
    label1a = [[UILabel alloc] initWithFrame:CGRectMake(10,20, [ImageView2 bounds].size.width-20, 20)];
    label2a = [[UILabel alloc] initWithFrame:CGRectMake(10,100, [ImageView2 bounds].size.width-20, 20)];
    label3a = [[UILabel alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-38,[someScrollView2 bounds].size.height*.2+24, 76, 76)];
    label2a.numberOfLines = 3;
    
    label2a.frame = CGRectMake(
                               label2a.frame.origin.x, label2a.frame.origin.y,
                               label2a.frame.size.width, label2a.frame.size.height*3);
    
    [label1a setTextColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    [label2a setTextColor:[UIColor darkGrayColor]];
    
    AlertButton1 = [[UIButton alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-70,50, 140, 40)];
    AlertButton2 = [[UIButton alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-70,80, 140, 40)];
    AlertButton3 = [[UIButton alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-70,110, 140, 40)];

    

    [AlertButton1 addTarget:self action:@selector(alert1press) forControlEvents:UIControlEventTouchUpInside];
    [AlertButton2 addTarget:self action:@selector(alert2press) forControlEvents:UIControlEventTouchUpInside];
    [AlertButton3 addTarget:self action:@selector(alert3press) forControlEvents:UIControlEventTouchUpInside];
    
    [AlertButton1 setTitleColor:[UIColor colorWithRed:0/255.0 green:126/255.0 blue:225/255.0 alpha:1.0f] forState:UIControlStateNormal];
    [AlertButton2 setTitleColor:[UIColor colorWithRed:0/255.0 green:126/255.0 blue:225/255.0 alpha:1.0f] forState:UIControlStateNormal];
    [AlertButton3 setTitleColor:[UIColor colorWithRed:0/255.0 green:126/255.0 blue:225/255.0 alpha:1.0f] forState:UIControlStateNormal];

    lineView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, [ImageView2 bounds].size.width, 1)];
    lineView1.backgroundColor = [UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0f];
    lineView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 110, [ImageView2 bounds].size.width, 1)];
    lineView2.backgroundColor = [UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0f];
    
    
    lineView1.hidden=YES;
    lineView1.hidden=YES;
    lineView1.alpha=0;
    lineView2.alpha=0;
    
    star1 = [[UIButton alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-120,150, 40, 40)];
    star2 = [[UIButton alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-70,150, 40, 40)];
    star3 = [[UIButton alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-20,150, 40, 40)];
    star4 = [[UIButton alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5+30,150, 40, 40)];
    star5 = [[UIButton alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5+80,150, 40, 40)];
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
    
    
    
    self.applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if ([self.applicationName length] == 0)
    {
        self.applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
        
    }
    
    label1a.hidden=YES;
    label1a.alpha=0;
    label2a.text=[NSString stringWithFormat: @"How do you like %@?" , _applicationName];

    [label1a setFont:[UIFont systemFontOfSize:17]];
    [label2a setFont:[UIFont systemFontOfSize:13]];
    
    label1a.textAlignment = NSTextAlignmentCenter;
    label2a.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    
    [self.view addSubview:someScrollView1];
    [self.view addSubview:someScrollView2];
    [someScrollView1 addSubview:ImageView1];
    
    
    
    [someScrollView2 addSubview:ImageView2];
    
    
    [someScrollView2 addSubview:AlertButton1];
    [someScrollView2 addSubview:AlertButton2];
    [someScrollView2 addSubview:AlertButton3];
    
    [someScrollView2 addSubview:lineView1];
    [someScrollView2 addSubview:lineView2];
    
    [someScrollView2 addSubview:ImageView3];
    [someScrollView2 addSubview:ImageView2b];

    [someScrollView2 addSubview:myImageView];
    [someScrollView2 addSubview:label1a];
    [someScrollView2 addSubview:label2a];
    [someScrollView2 addSubview:star1];
    [someScrollView2 addSubview:star2];
    
    [someScrollView2 addSubview:star3];
    [someScrollView2 addSubview:star4];
    
    [someScrollView2 addSubview:star5];
    
    
    
    
    AlertButton1.hidden=YES;
    AlertButton2.hidden=YES;
    AlertButton3.hidden=YES;
    
    someScrollView2.alpha=1;
    
    
    ImageView1.alpha=0.7;
    someScrollView2.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1.3);
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
                         [ImageView1 setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f]];
                         someScrollView2.layer.opacity = 1.0f;
                         someScrollView2.layer.transform = CATransform3DMakeScale(1, 1, 1);
					 }
					 completion:NULL
     ];
    
    
    
    
    
    
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation
//                                      animationWithKeyPath:@"transform"];
//    
//    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
//    CATransform3D scale2 = CATransform3DMakeScale(1.1, 1.1, 1);
//    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
//    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
//    
//    NSArray *frameValues = [NSArray arrayWithObjects:
//                            [NSValue valueWithCATransform3D:scale1],
//                            [NSValue valueWithCATransform3D:scale2],
//                            [NSValue valueWithCATransform3D:scale3],
//                            [NSValue valueWithCATransform3D:scale4],
//                            nil];
//    [animation setValues:frameValues];
//    
//    NSArray *frameTimes = [NSArray arrayWithObjects:
//                           [NSNumber numberWithFloat:0.0],
//                           [NSNumber numberWithFloat:0.5],
//                           [NSNumber numberWithFloat:0.9],
//                           [NSNumber numberWithFloat:1.0],
//                           nil];
//    [animation setKeyTimes:frameTimes];
//    
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
//    animation.duration = .2;
//    
//    [someScrollView2.layer addAnimation:animation forKey:@"popup"];
    
    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.5];
//    [UIView setAnimationDelay:0];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
//                           forView:star1
//                             cache:YES];
//    star1.transform = CGAffineTransformMakeScale(1.5,1.5);
//    
//    [UIView commitAnimations];
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.5];
//    [UIView setAnimationDelay:.1];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
//                           forView:star2
//                             cache:YES];
//    star2.transform = CGAffineTransformMakeScale(1.5,1.5);
//    [UIView commitAnimations];
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.5];
//    [UIView setAnimationDelay:.2];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
//                           forView:star3
//                             cache:YES];
//    star3.transform = CGAffineTransformMakeScale(1.5,1.5);
//    star1.transform = CGAffineTransformMakeScale(1,1);
//    
//    [UIView commitAnimations];
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.5];
//    [UIView setAnimationDelay:.3];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
//                           forView:star4
//                             cache:YES];
//    star4.transform = CGAffineTransformMakeScale(1.5,1.5);
//    star2.transform = CGAffineTransformMakeScale(1,1);
//    
//    [UIView commitAnimations];
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.5];
//    [UIView setAnimationDelay:.4];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
//                           forView:star5
//                             cache:YES];
//    star5.transform = CGAffineTransformMakeScale(1.5,1.5);
//    star3.transform = CGAffineTransformMakeScale(1,1);
//    
//    [UIView commitAnimations];
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.5];
//    [UIView setAnimationDelay:.5];
//    star4.transform = CGAffineTransformMakeScale(1,1);
//    
//    [UIView commitAnimations];
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.5];
//    [UIView setAnimationDelay:.6];
//    star5.transform = CGAffineTransformMakeScale(1,1);
//    
//    [UIView commitAnimations];
    
    
    
    
}


- (void)alert1press{
    NSLog(@"Open App Store");
    [self.view removeFromSuperview];
}
- (void)alert2press{
    NSLog(@"Rate Alerts Disabled");
    [self.view removeFromSuperview];
}
- (void)alert3press{
    NSLog(@"Reset Timer");
    [self.view removeFromSuperview];
}



- (void)HighRate{
    label1a.text=[NSString stringWithFormat: @"Great!"];
    label2a.text=[NSString stringWithFormat: @"Please support us by leaving your rating in the App Store; it really does help. Thanks from %@." , _applicationName ];
    
    if(CountStar==3){
        [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star4 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
        [star5 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
    }else if(CountStar==4){
        [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star4 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star5 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
    }else if(CountStar==5){
        [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star4 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star5 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    }
    
    label1a.transform = CGAffineTransformMakeScale(0,0);
    label2a.transform = CGAffineTransformMakeScale(0,0);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star1
                             cache:YES];
    star1.transform = CGAffineTransformMakeScale(1.5,1.5);
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star2
                             cache:YES];
    star2.transform = CGAffineTransformMakeScale(1.5,1.5);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.2];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star3
                             cache:YES];
    star3.transform = CGAffineTransformMakeScale(1.5,1.5);
    star1.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.3];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star4
                             cache:YES];
    star4.transform = CGAffineTransformMakeScale(1.5,1.5);
    star2.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.4];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star5
                             cache:YES];
    star5.transform = CGAffineTransformMakeScale(1.5,1.5);
    star3.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.5];
    star4.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.6];
    star5.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    
    
    [self performSelector:@selector(movestars2) withObject:nil afterDelay:.8];
}
- (void)LowRate{
    label1a.text=[NSString stringWithFormat: @"Help Us Improve"];
    label2a.text=[NSString stringWithFormat: @"Please let us know how we can improve. Thanks from %@." , _applicationName ];
    
    if(CountStar==1){
        [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
        [star3 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
        [star4 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
        [star5 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
    }else if(CountStar==2){
        [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        [star3 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
        [star4 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
        [star5 setBackgroundImage:[UIImage imageNamed:@"star3.png"] forState:UIControlStateNormal];
    }
    
    label1a.transform = CGAffineTransformMakeScale(0,0);
    label2a.transform = CGAffineTransformMakeScale(0,0);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star1
                             cache:YES];
    star1.transform = CGAffineTransformMakeScale(1.5,1.5);
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star2
                             cache:YES];
    star2.transform = CGAffineTransformMakeScale(1.5,1.5);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.2];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star3
                             cache:YES];
    star3.transform = CGAffineTransformMakeScale(1.5,1.5);
    star1.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.3];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star4
                             cache:YES];
    star4.transform = CGAffineTransformMakeScale(1.5,1.5);
    star2.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.4];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star5
                             cache:YES];
    star5.transform = CGAffineTransformMakeScale(1.5,1.5);
    star3.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.5];
    star4.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelay:.6];
    star5.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    
    
    [self performSelector:@selector(movestars2) withObject:nil afterDelay:.8];
}
- (void)star1press
{
    if(CountStar==0)
    {
        CountStar=1;
        [self LowRate];
    }
}
- (void)star2press
{
    if(CountStar==0)
    {
        CountStar=2;
        [self LowRate];
    }
}
- (void)star3press
{
    if(CountStar==0)
    {
        CountStar=3;
        [self HighRate];
    }

}
- (void)star4press
{
    if(CountStar==0)
    {
        CountStar=4;
        [self HighRate];
    }
}
- (void)star5press
{
    if(CountStar==0)
    {
        CountStar=5;
        [self HighRate];
    }
}



- (void)movestars2{
    if(CountStar==1||CountStar==2)
    {
        [AlertButton1 setTitle:@"Email Support" forState:UIControlStateNormal];
        [AlertButton2 setTitle:@"No, Thanks" forState:UIControlStateNormal];
        [AlertButton3 setTitle:@"Remind Me Later" forState:UIControlStateNormal];
    }
    else if(CountStar>=3)
    {
        [AlertButton1 setTitle:@"Yes, Rate It" forState:UIControlStateNormal];
        [AlertButton2 setTitle:@"No, Thanks" forState:UIControlStateNormal];
        [AlertButton3 setTitle:@"Remind Me Later" forState:UIControlStateNormal];
    }
    
    AlertButton1.hidden=NO;
    AlertButton2.hidden=NO;
    AlertButton3.hidden=NO;
    lineView1.hidden=NO;
    lineView1.hidden=NO;
    label1a.hidden=NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.2];
    [UIView setAnimationDelay:0];
    myImageView.alpha=0;
    ImageView2b.alpha=0;
    lineView1.alpha=.5;
    lineView2.alpha=.5;
    
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.8];
    [UIView setAnimationDelay:.2];
    label1a.transform = CGAffineTransformMakeScale(1,1);
    label2a.transform = CGAffineTransformMakeScale(1,1);
    
    label1a.alpha=1;

    AlertButton1.frame = CGRectMake([someScrollView2 bounds].size.width*.5-70,160, 140, 40);
    AlertButton2.frame = CGRectMake([someScrollView2 bounds].size.width*.5-70,196, 140, 40);
    AlertButton3.frame = CGRectMake([someScrollView2 bounds].size.width*.5-70,232, 140, 40);
    
    
    lineView1.frame = CGRectMake(0, 196, [ImageView2 bounds].size.width, 1);
    lineView2.frame = CGRectMake(0, 232, [ImageView2 bounds].size.width, 1);
    
    [ImageView3 setBackgroundColor:[UIColor whiteColor]];

    [ImageView2 setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0f]];

    
    [label2a setTextColor:[UIColor colorWithRed:0/255.0 green:145.0/255.0 blue:245.0/255.0 alpha:1.0f]];
    
    star1.frame = CGRectMake([someScrollView2 bounds].size.width*.5-130,50, 45, 45);
    star2.frame = CGRectMake([someScrollView2 bounds].size.width*.5-75,50, 45, 45);
    
    star3.frame = CGRectMake([someScrollView2 bounds].size.width*.5-20,50, 45, 45);

    star4.frame = CGRectMake([someScrollView2 bounds].size.width*.5+35,50, 45, 45);
    star5.frame = CGRectMake([someScrollView2 bounds].size.width*.5+90,50, 45, 45);
    
    ImageView2.frame = CGRectMake(0,10, [ImageView2 bounds].size.width, 260);
    
    ImageView3.frame = CGRectMake(2,12, [ImageView3 bounds].size.width, 152);
    
    
    
    [UIView commitAnimations];
    
}
- (void)Alert1{
    
}
- (void)Alert2{
    
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
