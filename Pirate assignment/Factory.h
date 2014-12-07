//
//  Factory.h
//  Pirate assignment
//
//  Created by Itamar Nakar on 23/11/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tile.h"
#import "Character.h"
//#import "ViewController.h"


@interface Factory : NSObject
    

    

@property (nonatomic, strong) NSMutableArray *tiles;
@property (nonatomic, strong) Character *character;
@property (nonatomic, strong) NSMutableArray *armors;
@property (nonatomic, strong) NSMutableArray *weapons;


-(void)assignTilesData; // Bilding Tiles Matrix and filling the each tile with data
-(Tile *)findTileByPoint:(CGPoint)point;
-(CGPoint)findPointByTile:(Tile *)tile;

-(void)assignCharacter; // When app starts and when resering
//-(void)updateCharecter; // Called Every moove

// When action pressed do theas four methods
-(int)updateCharectersHealth:(int)currentHealth usingHealthReduction:(int)healthReduction;
-(int)updateCharectersDamage:(int)currentDamage usingDamageAddition:(int)damageAddition;
-(void)updateArmor; // Calld from Tiles Matrix
-(void)updateWeapon; // Calld from Tiles Matrix

// When one direction pressed: return new CGPoint based on currentPoint and directionFlag
-(CGPoint)turnFromPoint:(CGPoint)currentPoint inDirection:(NSString *)directionFlag;
// Returns aDictionary fo "Compass Rose" with there BOOL enabler valu
-(NSMutableDictionary *)enableDirectionsAroundPoint:(CGPoint)currentPoint;

// When resetGame pressed: implement 'assignCharacter' and return point zero (1,1)
-(CGPoint)resetGame;
@end








