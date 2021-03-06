//  Hello!!!!
//  MainViewController.m
//  asdf
//
//  Created by Nick Culbertson on 2/20/14.
//  Copyright (c) 2014 Nick Culbertson. All rights reserved.
//

#import "MainViewController.h"
#import "DevBanner.h"
#import "DevRater.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize jsontext;
@synthesize customView = _customView;

- (void)viewDidLoad
{
    
    //    NSString *string = @"?at=10lun6";
    //
    //
    
    NSString *deviceType = [UIDevice currentDevice].model;
    NSString *version = [UIDevice currentDevice].systemVersion;
    NSString *stringBuilder;
    //    NSLocale *locale = [NSLocale currentLocale];
    //    stringBuilder = [stringBuilder stringByAppendingString:[locale objectForKey: NSLocaleCountryCode]];
    //    NSLog(@"%@",stringBuilder);
    
    
    //    self.applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    //    if ([self.applicationName length] == 0)
    //    {
    //        self.applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
    //    }
    
    
    NSLog(@"%@",deviceType);
    NSLog(@"%@",version);
    NSLog(@"%@",stringBuilder);
    
    
    
    
    
    
    
    //
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    NSString *string = @"55555555";
    //    NSString *string2 = @"777777";
    //    NSNumber *string3 = @888888;
    //
    //    [defaults setValue:string forKey:@"DevBannerJSON"];
    //    [defaults setValue:string2 forKey:@"DevBannerJSON2"];
    //    [defaults setValue:string3 forKey:@"DevBannerJSON3"];
    //
    //
    //
    //    [defaults synchronize];
    //
    //
    //    NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://devbanner.cloudapp.net/api/analytics/updateimpressions"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    //
    //    NSDictionary* jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"DevBannerJSON"],@"CampaignId",[[NSUserDefaults standardUserDefaults] objectForKey:@"DevBannerJSON2"],@"BannerId",[[NSUserDefaults standardUserDefaults] objectForKey:@"DevBannerJSON3"],@"Impressions",nil];
    //    NSError *error;
    //    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary options:NSJSONWritingPrettyPrinted error:&error];
    //
    //
    //
    //    [theRequest setHTTPMethod:@"POST"];
    //    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //    [theRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    //    [theRequest setHTTPBody:jsonData];
    //
    //    NSURLResponse *response = nil;
    //   NSData *result = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:&error];
    //
    //    if (error==nil) {
    //      NSLog(@"%@",result);
    //
    //    }
    
    
    self.jsontext.delegate = self;
    
    
    
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)ShowRateAlert{
    rateme =[[DevRater alloc]initWithNibName:nil bundle:nil];
    
    [self.view addSubview:rateme.view];
    
    [rateme show2];
}




-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [textField resignFirstResponder];
    
    NSString *myString = jsontext.text;
    NSLog(@"%@",myString);
    
    
    adbanner.DeveloperId = [NSString stringWithString:myString];
    
    
    
    
    
    return YES;
}
-(IBAction)resume{
    
    [adbanner show];
}

-(IBAction)hide{
    [adbanner hide];
    
}
-(IBAction)resetDict{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [adbanner hide];
    [adbanner.view removeFromSuperview];
    adbanner=nil;
}

-(IBAction)loadbanner{
    
    
    
    
    if (!adbanner) {
        
        adbanner =[[DevBanner alloc]initWithNibName:nil bundle:nil];
        NSString *myString = jsontext.text;
        if([jsontext.text isEqual:@""]){
            //adbanner.DeveloperId = @"298910979";//Rovio
            //adbanner.DeveloperId = @"347400510";//RainFrog
            //adbanner.DeveloperId = @"432169776";//A+ Kids Apps
            adbanner.DeveloperId = @"409029298";//Nick Culbertson
            //adbanner.DeveloperId = @"295646464";//Weather
            //adbanner.DeveloperId = @"366761192";//Dozer
            
            
            
            //Show FREE, PAID, or BOTH
            adbanner.AppType = @"BOTH";
            
            adbanner.useStars = @"YES";
            
            //Apps to include when populating DevBanner view
//            adbanner.IncludeAppID = [[NSArray alloc] initWithObjects:@"512060499",@"507803194",@"689546547",@"557785123",@"AppID_5", nil];
            
            //Apps to exclude when populating DevBanner view
//            adbanner.ExcludeAppID = [[NSArray alloc] initWithObjects:@"447600117",@"512062674",@"AppID_3",@"AppID_4",@"AppID_5", nil];
        }else{
            NSLog(@"%@",myString);
            adbanner.DeveloperId = [NSString stringWithString:myString];
        }
        
        [self.view addSubview:adbanner.view];
    }
    [adbanner show];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end