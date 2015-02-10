//
//  RSSEntry.m
//  RSSReader
//
//  Created by Gnrn on 09.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import "NewsFeed.h"

@implementation NewsFeed

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.link forKey:@"Link"];
    [coder encodeObject:self.desc forKey:@"Desc"];
    [coder encodeObject:self.title forKey:@"Title"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.link = [coder decodeObjectForKey:@"Link"];
        self.desc = [coder decodeObjectForKey:@"Desc"];
        self.title = [coder decodeObjectForKey:@"Title"];
    }
    return self;
}
- (BOOL)isEqual:(id)o {
    if (self == o) return YES;
    if (![o isKindOfClass:[NewsFeed class]]) return NO;
    
    NewsFeed *other = (NewsFeed *) o;
    
    if (self.link != nil ? ![self.link isEqual:other.link] : other.link != nil) return NO;
    if (self.title != nil ? ![self.title isEqual:other.title] : other.title != nil) return NO;
    if (self.desc != nil ? ![self.desc isEqual:other.desc] : other.desc != nil) return NO;
    return YES;
    
}
@end
