//
//  Character.h
//  Pirate assignment
//
//  Created by Itamar Nakar on 23/11/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "Armor.h"

@interface Character : NSObject

@property (nonatomic, strong) Weapon *weapon;
@property (nonatomic, strong) Armor *armor;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
