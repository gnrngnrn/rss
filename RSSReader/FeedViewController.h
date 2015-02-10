//
//  MasterViewController.h
//  RSSReader
//
//  Created by Gnrn on 09.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsFeed.h"
#import "WebViewViewController.h"
#import "FauvoritesArray.h"

@interface FeedViewController : UITableViewController <NSXMLParserDelegate,UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) NSURL *feedURL;
@property (strong,nonatomic) NSXMLParser *parser;
@property (strong,nonatomic) NSMutableArray *stories;
@property (strong,nonatomic) NewsFeed *currentFeed;
@property (strong,nonatomic) NSString *currentElement;
@property (strong,nonatomic) FauvoritesArray *favourites;

@end

