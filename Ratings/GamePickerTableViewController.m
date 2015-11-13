//
//  GamePickerTableViewController.m
//  Ratings
//
//  Created by Voitenko Daniil on 09.10.15.
//  Copyright © 2015 Voitenko Daniil. All rights reserved.
//

#import "GamePickerTableViewController.h"

@interface GamePickerTableViewController ()

@end

@implementation GamePickerTableViewController
{
    NSArray *_games;
    NSUInteger _selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _games = @[@"Angry Birds", @"Chess", @"Russian Roulette", @"Texas Hold'em"];
    
    _selectedIndex = [_games indexOfObject:self.game];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_games count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
    cell.textLabel.text = _games[indexPath.row];
    
    if (indexPath.row == _selectedIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_selectedIndex !=NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex
                                                                                    inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    _selectedIndex = indexPath.row;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSString *game = _games[indexPath.row];
    [self.delegate gamePickerTableViewController:self didSelectGame:game];
}

@end
