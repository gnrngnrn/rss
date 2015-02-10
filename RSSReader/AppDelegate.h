//
//  AppDelegate.h
//  RSSReader
//
//  Created by Gnrn on 09.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FauvoritesArray.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FauvoritesArray *singleton;


@end

