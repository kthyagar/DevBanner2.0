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



- (void)show{
    
        // Here we need to pass a full frame
        
        
        CustomAlertView *alertView = [[CustomAlertView alloc] init];
        // Add some custom content to the alert view
        [alertView setContainerView:[self createDemoView]];
        // Modify the parameters
    
    
    
    
    
    
    
    
    
   // NSMutableArray *buttons=[[NSMutableArray alloc] initWithObjects:@"Close1",@"Close1",@"Close1", @"Close2", @"Close3", nil];

    
    
    
    
    
    
    
    
    
    
  //      [alertView setButtonTitles:buttons];
   //     [alertView setDelegate:self];
    
//        [buttons[0] setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        [buttons[1] setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        [buttons[2] setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        [buttons[3] setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        [buttons[4] setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];

//    for (UIButton *btn in buttons)
//    {
//        [btn setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//    }
        // You may use a Block, rather than a delegate.
  //      [alertView setOnButtonTouchUpInside:^(CustomAlertView *alertView, int buttonIndex) {
  //          NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView tag]);
          //  [alertView close];
  //      }];
        
        [alertView setUseMotionEffects:true];
        
        // And launch the dialog
        [alertView show];
    }


- (void)customdialogButtonTouchUpInside: (CustomAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
    {
        NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView tag]);
       // [alertView close];
    }
    
- (UIView *)createDemoView
    {
        UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 220)];
        
        myImageView = [[UIImageView alloc] initWithFrame:CGRectMake([demoView bounds].size.width/2-38,[demoView bounds].size.height/2-38, 76, 76)];
        
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
        
        star1 = [[UIButton alloc] initWithFrame:CGRectMake(5,180, 40, 40)];
        star2 = [[UIButton alloc] initWithFrame:CGRectMake(65,180, 40, 40)];
        star3 = [[UIButton alloc] initWithFrame:CGRectMake(125,180, 40, 40)];
        star4 = [[UIButton alloc] initWithFrame:CGRectMake(185,180, 40, 40)];
        star5 = [[UIButton alloc] initWithFrame:CGRectMake(245,180, 40, 40)];
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
        
        
//        star1 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 40, 40)];
//        star2 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 40, 40)];
//        star3 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 40, 40)];
//        star4 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 40, 40)];
//        star5 = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 40, 40)];
//        [star1 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        [star2 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        [star3 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        [star4 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
//        
//        [star1 addTarget:self action:@selector(star1press) forControlEvents:UIControlEventTouchUpInside];
//        [star2 addTarget:self action:@selector(star2press) forControlEvents:UIControlEventTouchUpInside];
//        [star3 addTarget:self action:@selector(star3press) forControlEvents:UIControlEventTouchUpInside];
//        [star4 addTarget:self action:@selector(star4press) forControlEvents:UIControlEventTouchUpInside];
//        [star5 addTarget:self action:@selector(star5press) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 270, 180)];
        [imageView setImage:[UIImage imageNamed:@"Icon"]];
        [demoView addSubview:myImageView];
        [demoView addSubview:star1];
        [demoView addSubview:star2];
        [demoView addSubview:star3];
        [demoView addSubview:star4];
        [demoView addSubview:star5];

        
        return demoView;
    }


- (void)show2{
    someScrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    someScrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(15,[[UIScreen mainScreen] bounds].size.height*.5-110, 290, 220)];

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
//
//    ImageView3b = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*.5-45,[[UIScreen mainScreen] bounds].size.height*.2-32, 85, 85)];
//    [ImageView3b setBackgroundColor:[UIColor whiteColor]];
//    ImageView3b.alpha=1;
//    ImageView3b.layer.cornerRadius = 15;
//    ImageView3b.clipsToBounds = YES;
    
    myImageView = [[UIImageView alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-38,26, 76, 76)];
    
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
    
    label1a = [[UILabel alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.1+4,[someScrollView2 bounds].size.height*.2+11, [ImageView2 bounds].size.width-8, 20)];
    label2a = [[UILabel alloc] initWithFrame:CGRectMake(0,100, [ImageView2 bounds].size.width-8, 20)];
    label3a = [[UILabel alloc] initWithFrame:CGRectMake([someScrollView2 bounds].size.width*.5-38,[someScrollView2 bounds].size.height*.2+24, 76, 76)];
    label2a.numberOfLines = 3;
    
    label2a.frame = CGRectMake(
                               label2a.frame.origin.x, label2a.frame.origin.y,
                               label2a.frame.size.width, label2a.frame.size.height*3);
    
    [label1a setTextColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    [label2a setTextColor:[UIColor darkGrayColor]];
    
    
//    label1a.shadowColor =[UIColor colorWithWhite:1 alpha:.5];
//    label1a.shadowOffset = CGSizeMake(1,1);
//    label2a.shadowColor =[UIColor colorWithWhite:1 alpha:.5];
//    label2a.shadowOffset = CGSizeMake(1,1);
    
    
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
    
 //   label1a.text=self.applicationName;
//    label2a.text=[NSString stringWithFormat: @"Tell us how much you enjoy using %@." , _applicationName];
    label2a.text=[NSString stringWithFormat: @"How do you like %@?" , _applicationName];

    [label1a setFont:[UIFont systemFontOfSize:15]];
    //[label2a setFont:[UIFont fontWithName:@"Georgia" size:12]];
    [label2a setFont:[UIFont systemFontOfSize:12]];

    [label3a setFont:[UIFont systemFontOfSize:9]];
    
    //[label1a setTextAlignment:UITextAlignmentCenter];
    label1a.textAlignment = NSTextAlignmentCenter;
    label2a.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    
    [self.view addSubview:someScrollView1];
    [self.view addSubview:someScrollView2];
    [someScrollView1 addSubview:ImageView1];
    [someScrollView2 addSubview:ImageView2];
    [someScrollView2 addSubview:ImageView3];
    [someScrollView2 addSubview:ImageView2b];

//    [someScrollView1 addSubview:ImageView3b];
    [someScrollView2 addSubview:myImageView];
    [someScrollView2 addSubview:label1a];
    [someScrollView2 addSubview:label2a];
    [someScrollView2 addSubview:label3a];
    [someScrollView2 addSubview:star1];
    [someScrollView2 addSubview:star2];
    
    [someScrollView2 addSubview:star3];
    [someScrollView2 addSubview:star4];
    
    [someScrollView2 addSubview:star5];
    someScrollView2.alpha=1;
    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.4];
//    [UIView setAnimationDelay:0];
//    
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
//                           forView:someScrollView1
//                             cache:YES];
//    
//    someScrollView1.alpha=1;
//    
//    
//    [UIView commitAnimations];
    
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

- (void)star1press{
    // [someScrollView1 performSelectorOnMainThread:@selector(removeFromSuperview) withObject:nil waitUntilDone:NO];
    
    // UIView *view = [self viewWithTag:111];
    //self.view.frame=CGRectMake(0,0, 0, 0)];
    //[self.vie removeFromSuperview];
    
    //  UIView *removeView;
    [self.view removeFromSuperview];
    label2a.text=@"EMAIL SUPPORT";
    
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
}
- (void)star2press{
    label2a.text=@"EMAIL SUPPORT";
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
}
- (void)star3press{
    label2a.text=[NSString stringWithFormat: @"Great! Please support us by leaving your rating in the App Store. It really does help. Thanks from %@." , _applicationName ];
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    label2a.transform = CGAffineTransformMakeScale(0,0);

    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationDelay:0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                   forView:star1
                                     cache:YES];
    star1.transform = CGAffineTransformMakeScale(1.5,1.5);

    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationDelay:.1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star2
                             cache:YES];
    star2.transform = CGAffineTransformMakeScale(1.5,1.5);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationDelay:.2];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star3
                             cache:YES];
    star3.transform = CGAffineTransformMakeScale(1.5,1.5);
    star1.transform = CGAffineTransformMakeScale(1,1);

    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationDelay:.3];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star4
                             cache:YES];
    star4.transform = CGAffineTransformMakeScale(1.5,1.5);
    star2.transform = CGAffineTransformMakeScale(1,1);

    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationDelay:.4];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:star5
                             cache:YES];
    star5.transform = CGAffineTransformMakeScale(1.5,1.5);
    star3.transform = CGAffineTransformMakeScale(1,1);

    [UIView commitAnimations];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationDelay:.5];
    star4.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationDelay:.6];
    star5.transform = CGAffineTransformMakeScale(1,1);
    
    [UIView commitAnimations];
    
    
    [self performSelector:@selector(movestars2) withObject:nil afterDelay:1.];

    //[self movestars];
    //Animation then this
 //   [self.view removeFromSuperview];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Great!"
//                  message:@"Would you mind leaving a positive review or rating in the App Store? It's really appreciated!"  delegate:self cancelButtonTitle:@"Maybe Later" otherButtonTitles:nil];
//    
//    
//    
//    [alert addButtonWithTitle:@"Review App"];
//    [alert addButtonWithTitle:@"No Thanks"];
//    [alert show];
}

//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
//    if (buttonIndex == 1) {
//        NSLog(@"Press 1");
//    }
//    if (buttonIndex == 2) {
//        NSLog(@"Press 2");
//    }
//    if (buttonIndex == 0) {
//        NSLog(@"Press 3");
//    }
//}

- (void)star4press{
    label2a.text=@"Great! Would you mind taking a moment to rate it? It really does help. Thanks for your support!";
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
}
- (void)star5press{
    label2a.text=@"Excellent! Would you mind taking a moment to leave a nice review? It really does help. Thanks for your support!";
    [star1 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
}

- (void)movestars1{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.2];
    [UIView setAnimationDelay:0];
    myImageView.alpha=0;
    ImageView2b.alpha=0;
    label1a.alpha=0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:.2];
    
    label2a.transform = CGAffineTransformMakeScale(1,1);
    
    star1.frame = CGRectMake([someScrollView2 bounds].size.width*.5-130,50, 45, 45);
    star2.frame = CGRectMake([someScrollView2 bounds].size.width*.5-75,50, 45, 45);
    
    star3.frame = CGRectMake([someScrollView2 bounds].size.width*.5-20,50, 45, 45);
    
    star4.frame = CGRectMake([someScrollView2 bounds].size.width*.5+35,50, 45, 45);
    star5.frame = CGRectMake([someScrollView2 bounds].size.width*.5+90,50, 45, 45);
    
    ImageView2.frame = CGRectMake(0,30, [ImageView2 bounds].size.width, 180);
    
    ImageView3.frame = CGRectMake(2,32, [ImageView3 bounds].size.width, 132);
    
    
    
    [UIView commitAnimations];
    
}

- (void)movestars2{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.2];
    [UIView setAnimationDelay:0];
    myImageView.alpha=0;
    ImageView2b.alpha=0;
    label1a.alpha=0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:.2];
    
    label2a.transform = CGAffineTransformMakeScale(1,1);

    star1.frame = CGRectMake([someScrollView2 bounds].size.width*.5-130,50, 45, 45);
    star2.frame = CGRectMake([someScrollView2 bounds].size.width*.5-75,50, 45, 45);
    
    star3.frame = CGRectMake([someScrollView2 bounds].size.width*.5-20,50, 45, 45);

    star4.frame = CGRectMake([someScrollView2 bounds].size.width*.5+35,50, 45, 45);
    star5.frame = CGRectMake([someScrollView2 bounds].size.width*.5+90,50, 45, 45);
    
    ImageView2.frame = CGRectMake(0,30, [ImageView2 bounds].size.width, 180);
    
    ImageView3.frame = CGRectMake(2,32, [ImageView3 bounds].size.width, 132);
    
    
    
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
