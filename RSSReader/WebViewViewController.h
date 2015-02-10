//
//  DetailViewController.h
//  RSSReader
//
//  Created by Gnrn on 09.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsFeed.h"
#import <Social/Social.h>

@interface WebViewViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) NewsFeed *feed;

- (IBAction)tweet:(id)sender;

@end

