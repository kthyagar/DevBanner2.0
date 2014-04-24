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
    
    
    

    rateme =[[DevRater alloc]initWithNibName:nil bundle:nil];
    //rateme =[[DevRater alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    
    
    [self.view addSubview:rateme.view];

    [rateme show];


    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [textField resignFirstResponder];
    
    NSString *myString = jsontext.text;
    NSLog(@"%@",myString);
    
    
    adbanner.CampaignID = [NSString stringWithString:myString];

    
    
    
    
    return YES;
}
-(IBAction)resume{
    
    [adbanner show];
}

-(IBAction)hide{
    [adbanner hide];
    
}

-(IBAction)loadbanner{
    
    
    
    
    if (!adbanner) {
        
    adbanner =[[DevBanner alloc]initWithNibName:nil bundle:nil];
    NSString *myString = jsontext.text;
    if([jsontext.text isEqual:@""]){
 //  adbanner.CampaignID = @"298910979";
        
        
   adbanner.CampaignID = @"347400510";
        
        
//
//      adbanner.DevID = @"347400510";
        

    adbanner.AppID = [[NSArray alloc] initWithObjects:@"AppID_1",@"AppID_2",@"AppID_3",@"AppID_4",@"AppID_5", nil];
   }else{
    NSLog(@"%@",myString);
    adbanner.CampaignID = [NSString stringWithString:myString];
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
