//
//  MasterViewController.m
//  RSSReader
//
//  Created by Gnrn on 09.02.15.
//  Copyright (c) 2015 Gnrn. All rights reserved.
//

#import "FeedViewController.h"
#import "WebViewViewController.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Работа водителям";
    self.stories = [[NSMutableArray alloc]init];
    self.favourites = [FauvoritesArray sharedInstance];
    self.feedURL = [NSURL URLWithString:@"http://www.rabota.kharkov.ua/informers/vacancies/rss/?category=27"];
    [self retrieveFomInternet];
    
}
-(void)retrieveFomInternet{
    NSURLRequest *request = [NSURLRequest requestWithURL:self.feedURL];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    self.parser = [[NSXMLParser alloc]initWithData:data];
    self.parser.delegate = self;
    [self.parser parse];
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    self.currentElement = elementName;
    if([self.currentElement isEqualToString:@"item"])
    {
        self.currentFeed = [[NewsFeed alloc]init];
    }
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (!self.currentElement) return;
    if([self.currentElement isEqualToString:@"title"])
    {
        self.currentFeed.title=string;
    }else if([self.currentElement isEqualToString:@"description"])
    {
        self.currentFeed.desc=string;
    }else if([self.currentElement isEqualToString:@"link"])
    {
        self.currentFeed.link=string;
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"item"])
    {
        [self.stories addObject:self.currentFeed];
    }
    self.currentElement=nil;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewViewController *cont = [segue destinationViewController];
    NSIndexPath *indePath = [self.tableView indexPathForSelectedRow];
    cont.feed = self.stories[indePath.row];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    [cell.textLabel setText:[self.stories[indexPath.row] title]];
    cell.detailTextLabel.attributedText = [[NSAttributedString alloc] initWithString:[self.stories[indexPath.row] desc]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.stories removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if ([self.favourites.dataArray containsObject: self.stories[indexPath.row]]) {
        [self.favourites.dataArray removeObject:self.stories[indexPath.row]];
        NSLog(@"remove!");
    }else{
        [self.favourites.dataArray addObject:self.stories[indexPath.row]];
    }
}

@end
