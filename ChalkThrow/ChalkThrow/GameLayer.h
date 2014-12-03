//
//  GameLayer.h
//  ChalkThrow
//
//  Created by Stella on 14/11/30.
//  Copyright (c) 2014年 Stella. All rights reserved.
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface GameLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    NSMutableArray *students;
    NSMutableArray *_chalks;
    
    CCAnimation *bottomSittingAnim;
    CCAnimation *topSittingAnim;
    CCAnimation *bottomSleepAnim;
    CCAnimation *topSleepAnim;
    CCAnimation *bottomHitAnim;
    CCAnimation *topHitAnim;
    
    CCLabelTTF *scoreLabel;
    int score;
    int totalSpawns;
    BOOL gameOver;
}

// returns a CCScene that contains the GameLayer as the only child
+(CCScene *) scene;

@end