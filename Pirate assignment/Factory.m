//
//  Factory.m
//  Pirate assignment
//
//  Created by Itamar Nakar on 23/11/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "Factory.h"
#define kNumberOfColumns 4
#define kNumberOfRows 3
#define kNumberOfArmors 5
#define kNumberOfWeapons 5


@implementation Factory

#pragma mark - Matrix methods
-(void)assignTilesData
{
    self.tiles = [NSMutableArray array];
    
    for (int i = 1; i <=kNumberOfColumns ; i++) {
        for (int j = 1; j <= kNumberOfRows; j++) {
            Tile *tile = [[Tile alloc]init];
            tile.point = CGPointMake(i, j); // Assigning 'column' number to point.x and 'row' number to point.y
            if ((int)tile.point.x == 1) { // column 1
                switch ((int)tile.point.y) {
                    case 1:
                        tile.story = @"Pirate Start";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
                        tile.actionButtonName = @"bon Voyage !";
                        tile.healthReduction = 0;
                        tile.damageAddition = 0;
                        [self.tiles addObject:tile];
                        break;
                    case 2:
                        tile.story = @"Pirate Friendly Dock\nUpdate Weapon";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
                        tile.actionButtonName = @"rest befor jurny";
                        tile.healthReduction = 1;
                        tile.damageAddition = 0;
                        tile.shouldUpdatWeapon = YES;
                        [self.tiles addObject:tile];
                        break;
                        
                    case 3:
                        tile.story = @"Pirate Parrot";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
                        tile.actionButtonName = @"Strangl!";
                        tile.healthReduction = -1;
                        tile.damageAddition = 0;
                        [self.tiles addObject:tile];
                        break;
                }
            } else if ((int)tile.point.x == 2){ // column 2
                switch ((int)tile.point.y) {
                    case 1:
                        tile.story = @"Pirate Blacksmith\nUpdate Armor";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
                        tile.actionButtonName = @"Help";
                        tile.healthReduction = 0;
                        tile.damageAddition = 1;
                        tile.shouldUpdatArmor = YES;
                        [self.tiles addObject:tile];
                        break;
                    case 2:
                        tile.story = @"Pirate Weapons\nUpdate Armor\nUpdate Weapon";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
                        tile.actionButtonName = @"Buy!";
                        tile.healthReduction = 0;
                        tile.damageAddition = 1;
                        tile.shouldUpdatArmor = YES;
                        tile.shouldUpdatWeapon = YES;
                        [self.tiles addObject:tile];
                        break;
                    case 3:
                        tile.story = @"Pirate Attack";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
                        tile.actionButtonName = @"Charge!!";
                        tile.healthReduction = -1;
                        tile.damageAddition = 1;
                        [self.tiles addObject:tile];
                        break;
                }
            } else if ((int)tile.point.x == 3){ // column 3
                switch ((int)tile.point.y) {
                    case 1:
                        tile.story = @"Pirate Plank";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
                        tile.actionButtonName = @"Fight!";
                        tile.healthReduction = -1;
                        tile.damageAddition = 0;
                        [self.tiles addObject:tile];
                        break;
                    case 2:
                        tile.story = @"Pirate Boss";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
                        tile.actionButtonName = @"Give weapon";
                        tile.healthReduction = -1;
                        tile.damageAddition = 1;
                        [self.tiles addObject:tile];
                        break;
                    case 3:
                        tile.story = @"Pirate Octopus Attack";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
                        tile.actionButtonName = @"Jump!";
                        tile.healthReduction = -2;
                        tile.damageAddition = 1;
                        [self.tiles addObject:tile];
                        break;
                }
            } else if ((int)tile.point.x == 4){ // column 4
                switch ((int)tile.point.y) {
                    case 1:
                        tile.story = @"Pirate Ship Battle";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
                        tile.actionButtonName = @"Fight back!";
                        tile.healthReduction = -2;
                        tile.damageAddition = 1;
                        [self.tiles addObject:tile];
                        break;
                    case 2:
                        tile.story = @"Pirate Treasurer 2";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
                        tile.actionButtonName = @"Collect!!";
                        tile.healthReduction = 0;
                        tile.damageAddition = 0;
                        [self.tiles addObject:tile];
                        break;
                    case 3:
                        tile.story = @"Pirate Treasurer";
                        tile.tileBackgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
                        tile.actionButtonName = @"Collect!!";
                        tile.healthReduction = 0;
                        tile.damageAddition = 0;
                        [self.tiles addObject:tile];
                        break;
                }
            }
        }// End of second 'for' loop
    }// End of first 'for' loop
}

-(Tile *)findTileByPoint:(CGPoint)point
{
    Tile *returnTile = [[Tile alloc] init];
    for (Tile *tile in self.tiles) {
        if (tile.point.x == point.x && tile.point.y == point.y) {
            returnTile = tile;
        }
    }
    return returnTile;
}

-(CGPoint)findPointByTile:(Tile *)tile{
    CGPoint point = tile.point;
    return point;
}

#pragma mark - Character methods
-(void)armorsArray
{
    self.armors = [NSMutableArray array];
    
    Armor *newArmmor = [[Armor alloc] init];
    newArmmor.name = @"Sheald";
    newArmmor.health = 1;
    [self.armors addObject:newArmmor];
    
    newArmmor = [[Armor alloc] init];
    newArmmor.name = @"Life Saver";
    newArmmor.health = 1;
    [self.armors addObject:newArmmor];
    
    newArmmor = [[Armor alloc] init];
    newArmmor.name = @"Bullet proof hat";
    newArmmor.health = 1;
    [self.armors addObject:newArmmor];
    
    newArmmor = [[Armor alloc] init];
    newArmmor.name = @"Wax";
    newArmmor.health = 1;
    [self.armors addObject:newArmmor];
}

-(void)weaponsArray
{
    self.weapons = [NSMutableArray array];
    Weapon *newWeapon = [[Weapon alloc] init];
    newWeapon.name = @"Fist";
    newWeapon.damage = 1;
    [self.weapons addObject:newWeapon];
    
    newWeapon = [[Weapon alloc] init];
    newWeapon.name = @"Sowrd";
    newWeapon.damage = 2;
    [self.weapons addObject:newWeapon];
    
    newWeapon = [[Weapon alloc] init];
    newWeapon.name = @"Gun";
    newWeapon.damage = 3;
    [self.weapons addObject:newWeapon];
    
    newWeapon = [[Weapon alloc] init];
    newWeapon.name = @"Bomb";
    newWeapon.damage = 4;
    [self.weapons addObject:newWeapon];
}

-(void)assignCharacter
{
    [self armorsArray];
    [self weaponsArray];
    
    self.character = [[Character alloc]init];
    self.character.armor = [self.armors objectAtIndex:0];
    self.character.weapon = [self.weapons objectAtIndex:0];
    self.character.health = 10;
    self.character.damage = 0;
}

-(int)updateCharectersHealth:(int)currentHealth usingHealthReduction:(int)healthReduction
{
    return currentHealth + healthReduction;
    // Dont fogget to implement 'if (return == 0) {[UIAlertView show]};
}

-(int)updateCharectersDamage:(int)currentDamage usingDamageAddition:(int)damageAddition
{
    return currentDamage + damageAddition;
}

-(void)updateArmor
{
    
    if (self.character.armor != self.armors.lastObject) {// Insure being in array bounderies
    
        int currentArmorIndex = 0;
        for (Armor *arm in self.armors) {
            if ([self.character.armor.name isEqualToString:arm.name]) {
                currentArmorIndex = [self.armors indexOfObject:arm];
                currentArmorIndex++;
            }
        }
    NSLog(@"%@",self.character.armor.name);
    self.character.armor = [self.armors objectAtIndex:currentArmorIndex];
    NSLog(@"%@",self.character.armor.name);
    
    }
}

-(void)updateWeapon
{
    if (self.character.weapon != self.weapons.lastObject) {// Insure remaining in array bounderies
            
            int currentWeaponIndex = 0;
            for (Weapon *wpn in self.weapons) {
                if ([self.character.weapon.name isEqualToString:wpn.name]) {
                    currentWeaponIndex = [self.weapons indexOfObject:wpn];
                    currentWeaponIndex++;
                }
            }
            NSLog(@"%@",self.character.weapon.name);
            self.character.weapon = [self.weapons objectAtIndex:currentWeaponIndex];
    }
   
}

#pragma mark - Moovment \ Direction methods
-(CGPoint)turnFromPoint:(CGPoint)currentPoint inDirection:(NSString *)directionFlag
{
    CGPoint newPoint;
    
    if ([directionFlag isEqualToString:@"N"] && currentPoint.y < kNumberOfRows) {
        newPoint = CGPointMake(currentPoint.x , currentPoint.y+1);
    } else if ([directionFlag isEqualToString:@"S"] && currentPoint.y > 1){
        newPoint = CGPointMake(currentPoint.x , currentPoint.y-1);
    } else if ([directionFlag isEqualToString:@"E"] && currentPoint.x < kNumberOfColumns){
        newPoint = CGPointMake(currentPoint.x+1 , currentPoint.y);
    } else if ([directionFlag isEqualToString:@"W"] && currentPoint.x > 1){
        newPoint = CGPointMake(currentPoint.x-1 , currentPoint.y);
    } else {
        newPoint = currentPoint;
    }
     return newPoint;
}

// Maneg directionButtons avilablity
-(NSMutableDictionary *)enableDirectionsAroundPoint:(CGPoint)currentPoint
{
    // Directions set in a clock order
    BOOL north = YES;
    BOOL east = YES;
    BOOL south = YES;
    BOOL west = YES;
    
    float alphaN = 1;
     float alphaE = 1;
     float alphaS = 1;
     float alphaW = 1;
    
    if (currentPoint.x == 1){
        west = NO;
        alphaW = 0.5;
    }
    if (currentPoint.y == 1) {
        south = NO;
        alphaS = 0.5;
    }
    
    if (currentPoint.x == kNumberOfColumns) {
        east = NO;
        alphaE = 0.5;
    }
    
    if (currentPoint.y == kNumberOfRows) {
        north = NO;
        alphaN = 0.5;
    }
    
    NSMutableDictionary *returnDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                             [NSNumber numberWithBool:north], @"N",
                                             [NSNumber numberWithBool:east], @"E",
                                             [NSNumber numberWithBool:south], @"S",
                                             [NSNumber numberWithBool:west], @"W",
                                             
                                             [NSNumber numberWithFloat:alphaN], @"alphaN",
                                             [NSNumber numberWithFloat:alphaE], @"alphaE",
                                             [NSNumber numberWithFloat:alphaS], @"alphaS",
                                             [NSNumber numberWithFloat:alphaW], @"alphaW",
                                             
                                             nil];
    
    return returnDictionary;
}

-(BOOL)enableDirection:(NSString *)directionFlag fromPoint:(CGPoint)currentPoint
{
    BOOL returnBool = NO;
    /////////////////////////// Need to sea if needed
    return returnBool;
}


#pragma mark - Reset
-(CGPoint)resetGame
{
    [self assignCharacter];
    [self assignTilesData];
    return CGPointMake(1, 1);
}
@end









