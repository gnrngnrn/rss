//
//  DetailViewController.m
//  RSSReader
//
//  Created by Gnrn on 09.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.frame = self.view.bounds;
    NSURL *url = [NSURL URLWithString:self.feed.link];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
}

-(void) viewWillAppear:(BOOL)animated
{
    NSURL *url = [NSURL URLWithString:self.feed.link];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (IBAction)tweet:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        NSString *textPart = [NSString stringWithFormat:@"%@\n%@",self.feed.title,self.feed.desc];
        [tweetSheet setInitialText:textPart];
        [tweetSheet addURL:[NSURL URLWithString:self.feed.link]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure\nyour device has an internet connection and you have\nat least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
    
}

@end
