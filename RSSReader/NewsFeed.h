//
//  RSSEntry.h
//  RSSReader
//
//  Created by Gnrn on 09.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsFeed : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *desc;
@property (strong,nonatomic) NSString *link;

@end
