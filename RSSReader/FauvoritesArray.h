//
//  SingletonUsersArray.h
//  Users_Wheather
//
//  Created by Gnrn on 28.01.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsFeed.h"

@interface FauvoritesArray : NSObject{
    NSMutableArray *dataArray;
}

@property (nonatomic,strong) NSMutableArray *dataArray;

+(FauvoritesArray *) sharedInstance;
-(void)saveToPlist;
-(void)loadArrayOfLinks;

@end
