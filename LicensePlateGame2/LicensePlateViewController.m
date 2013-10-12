//
//  LicensePlateViewController.m
//  LicensePlateGame2
//
//  Created by Hussachai Puripunpinyo on 10/12/13.
//  Copyright (c) 2013 Hussachai Puripunpinyo. All rights reserved.
//

#import "LicensePlateViewController.h"

@interface LicensePlateViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation LicensePlateViewController

- (id)init{
    NSLog(@"HELLO");
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:
            [NSURL URLWithString: self.licensePlateUrl]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
