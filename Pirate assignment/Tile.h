//
//  Tile.h
//  Pirate assignment
//
//  Created by Itamar Nakar on 23/11/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tile : NSObject

//@property (nonatomic) int tileID;
@property (nonatomic) CGPoint point;
@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) UIImage* tileBackgroundImage;
@property (nonatomic, strong) NSString *actionButtonName;

@property (nonatomic) int healthReduction;
@property (nonatomic) int damageAddition;

@property (nonatomic) BOOL shouldUpdatArmor;
@property (nonatomic) BOOL shouldUpdatWeapon;

@end
