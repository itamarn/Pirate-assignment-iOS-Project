//
//  ViewController.h
//  Pirate assignment
//
//  Created by Itamar Nakar on 23/11/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Factory.h"

@interface ViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) Factory *factory;
@property (strong, nonatomic) Tile *tile;
@property (strong, nonatomic) Character* character;

//Character section
@property (strong, nonatomic) IBOutlet UILabel *healthLable;
@property (strong, nonatomic) IBOutlet UILabel *damageLable;
@property (strong, nonatomic) IBOutlet UILabel *weaponLable;
@property (strong, nonatomic) IBOutlet UILabel *armorLable;

//Action section
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
- (IBAction)actionButtonPressed:(UIButton *)sender;

//Story section
@property (strong, nonatomic) IBOutlet UILabel *storyLable;

//Super view content
@property (strong, nonatomic) IBOutlet UIImageView *tileImageView;

@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

//Directions
-(void)turnInDirection:(NSString *)direction;

- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;

// Start / Restart View
- (IBAction)resetGameButtonPressed:(UIButton *)sender;

-(void )startNewGame;
-(void)refreshGameTileViewWithPoint:(CGPoint )point;
-(void)enableDitrctionButtonsAroundPoint:(CGPoint)currentPoint;

@end








