//
//  SingletonUsersArray.m
//  Users_Wheather
//
//  Created by Gnrn on 28.01.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import "FauvoritesArray.h"

@implementation FauvoritesArray
@synthesize dataArray;
static FauvoritesArray *favouritesArray = nil;
+(FauvoritesArray *) sharedInstance{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        favouritesArray = [[FauvoritesArray alloc] init];
        favouritesArray.dataArray = [[NSMutableArray alloc] init];
    });
    
    return favouritesArray;
}
-(void)saveToPlist
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory =  [pathList  objectAtIndex:0];
    NSString *path = [NSString stringWithFormat:@"%@%@",documentsDirectory,@"Favourites.plist"];
    NSFileManager *m = [NSFileManager defaultManager];
    if ([m fileExistsAtPath:path]) {
        NSError *error;
        [m removeItemAtPath:path error:&error];
        [NSKeyedArchiver archiveRootObject:self.dataArray toFile:path];
    }else{
        [NSKeyedArchiver archiveRootObject:self.dataArray toFile:path];
    }
}

-(void)loadArrayOfLinks
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory =  [pathList  objectAtIndex:0];
    NSString *path = [NSString stringWithFormat:@"%@%@",documentsDirectory,@"Favourites.plist"];
    NSFileManager *m = [[NSFileManager alloc] init];
    if ([m fileExistsAtPath:path]) {
        self.dataArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }else{
        self.dataArray = [[NSMutableArray alloc] init];
    }
}
@end
