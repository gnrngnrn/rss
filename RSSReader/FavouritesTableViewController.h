//
//  FavouritesTableViewController.h
//  RSSReader
//
//  Created by Gnrn on 10.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FauvoritesArray.h"
#import "WebViewViewController.h"

@interface FavouritesTableViewController : UITableViewController

@property (strong,nonatomic) FauvoritesArray *favourites;

@end
