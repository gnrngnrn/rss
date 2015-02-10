//
//  FavouritesTableViewController.m
//  RSSReader
//
//  Created by Gnrn on 10.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import "FavouritesTableViewController.h"

@interface FavouritesTableViewController ()

@end

@implementation FavouritesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Избранное";
    self.favourites = [FauvoritesArray sharedInstance];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.favourites.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    [cell.textLabel setText:[self.favourites.dataArray[indexPath.row] title]];
    cell.detailTextLabel.attributedText = [[NSAttributedString alloc] initWithString:[self.favourites.dataArray[indexPath.row] desc]];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    WebViewViewController *cont = [self.storyboard instantiateViewControllerWithIdentifier:@"WebController"];
    cont.feed = self.favourites.dataArray[indexPath.row];
    [self.navigationController pushViewController:cont animated:YES];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.favourites.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


@end
