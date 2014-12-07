//
//  Boss.m
//  Pirate assignment
//
//  Created by Itamar Nakar on 27/11/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "Boss.h"

@implementation Boss

-(void) creatBoss
{
    self.boss = [[Character alloc]init];
    self.boss.health = 65;
    self.boss.damage = -10;
}
@end
