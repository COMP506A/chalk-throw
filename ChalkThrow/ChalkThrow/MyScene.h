//
//  MyScene.h
//  ChalkThrow
//
//  Created by Stella on 14/11/30.
//  Copyright (c) 2014年 Stella. All rights reserved.
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface MyScene : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    NSMutableArray *students;
    
    CCAnimation *laughAnim;
    CCAnimation *hitAnim;
    
    CCLabelTTF *label;
    int score;
    int totalSpawns;
    BOOL gameOver;
}

// returns a CCScene that contains the MyScene as the only child
+(CCScene *) scene;

@end