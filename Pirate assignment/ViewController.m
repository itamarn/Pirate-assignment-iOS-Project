//
//  ViewController.m
//  Pirate assignment
//
//  Created by Itamar Nakar on 23/11/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.factory = [[Factory alloc] init];
    [self startNewGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action button Pressed
- (IBAction)actionButtonPressed:(UIButton *)sender
{
    // Solving Health issues
    self.factory.character.health = [self.factory updateCharectersHealth:self.factory.character.health usingHealthReduction:self.tile.healthReduction];
    self.healthLable.text = [NSString stringWithFormat:@"%i",self.factory.character.health];
    if (self.factory.character.health == 0) {
        UIAlertView* endGameAlert =  [[UIAlertView alloc]initWithTitle:@"GameOver" message:@"Didn't u see it coming?!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Restart" , nil];
        [endGameAlert show];
    }
    
    // Solving damage issues
    self.factory.character.damage = [self.factory updateCharectersHealth:self.factory.character.damage usingHealthReduction:self.tile.damageAddition];
    self.damageLable.text = [NSString stringWithFormat:@"%i",self.factory.character.damage];
    
    // Weapon upgrad if relevent on this tile
    if (self.tile.shouldUpdatWeapon == YES) {
        [self.factory updateWeapon];
        self. weaponLable.text =  self.factory.character.weapon.name;
    }
     // Armor upgrad if relevent on this tile
    if (self.tile.shouldUpdatArmor == YES) {
        [self.factory updateArmor];
        self.armorLable.text = self.factory.character.armor.name;
    }
    [sender setEnabled:NO];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self startNewGame];
    }
}

#pragma mark - Direction buttons pressed

- (IBAction)northButtonPressed:(UIButton *)sender
{
    [self turnInDirection:@"N"];
    
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    [self turnInDirection:@"E"];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
   [self turnInDirection:@"S"];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    [self turnInDirection:@"W"];
}

-(void)turnInDirection:(NSString *)direction
{
    CGPoint currentPoint = [self.factory findPointByTile:self.tile];
    CGPoint newPoint = [self.factory turnFromPoint:currentPoint  inDirection:direction];
    
    // Action button - Enableing it back
    if (newPoint.x != currentPoint.x || newPoint.y != currentPoint.y) {
        [self.actionButton setEnabled:YES];
        
        [self refreshGameTileViewWithPoint:newPoint];
    }
}

#pragma mark - Start / Restart game

- (IBAction)resetGameButtonPressed:(UIButton *)sender {
    [self startNewGame];
}

-(void )startNewGame
{
    CGPoint startpoint = [self.factory resetGame]; //this methode makes all of the assignment.. probbly wil have to orgenize it more
    [self refreshGameTileViewWithPoint:startpoint];
}

-(void)refreshGameTileViewWithPoint:(CGPoint )point
{
    self.tile = [self.factory findTileByPoint:point];
    
    self.tileImageView.image = self.tile.tileBackgroundImage;
    self.storyLable.text = self.tile.story;
    [self.actionButton setTitle:self.tile.actionButtonName forState:0];
    
    self.healthLable.text = [NSString stringWithFormat:@"%i",self.factory.character.health];
    self.damageLable.text =  [NSString stringWithFormat:@"%i",self.factory.character.damage];
    self. weaponLable.text =  self.factory.character.weapon.name;
    self.armorLable.text = self.factory.character.armor.name;
    
    // Direction buttons - Enableing / Disableing
    [self enableDitrctionButtonsAroundPoint:point];
    
}

-(void)enableDitrctionButtonsAroundPoint:(CGPoint)currentPoint
{
    NSDictionary *dict = [self.factory enableDirectionsAroundPoint:currentPoint];
    [self.northButton setEnabled:[[dict objectForKey:@"N"] boolValue]];
    [self.northButton setAlpha:[[dict objectForKey:@"alphaN"] floatValue]];
    [self.eastButton setEnabled:[[dict objectForKey:@"E"] boolValue]];
     [self.eastButton setAlpha:[[dict objectForKey:@"alphaE"] floatValue]];
    [self.southButton setEnabled:[[dict objectForKey:@"S"] boolValue]];
     [self.southButton setAlpha:[[dict objectForKey:@"alphaS"] floatValue]];
    [self.westButton setEnabled:[[dict objectForKey:@"W"] boolValue]];
     [self.westButton setAlpha:[[dict objectForKey:@"alphaW"] floatValue]];
   
}

@end
