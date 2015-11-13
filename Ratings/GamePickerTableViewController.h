//
//  GamePickerTableViewController.h
//  Ratings
//
//  Created by Voitenko Daniil on 09.10.15.
//  Copyright © 2015 Voitenko Daniil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GamePickerTableViewController;

@protocol GamePickeTableViewControllerDelegate <NSObject>

-(void)gamePickerTableViewController:(GamePickerTableViewController *)controller didSelectGame:(NSString *)game;

@end

@interface GamePickerTableViewController : UITableViewController

@property (nonatomic, weak) id <GamePickeTableViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *game;

@end
