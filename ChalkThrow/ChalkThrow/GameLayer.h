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

#define ENDNUMBER 30
// HelloWorldLayer
@interface GameLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    NSMutableArray *students;
    NSMutableArray *_chalks;
    
    CCAnimation *bottomBlinkAnim;
    CCAnimation *topBlinkAnim;
    CCAnimation *bottomSleepAnim;
    CCAnimation *topSleepAnim;
    CCAnimation *bottomSittingAnim;
    CCAnimation *topSittingAnim;
    CCAnimation *bottomHitCorrectAnim;
    CCAnimation *topHitCorrectAnim;
    CCAnimation *bottomHitWrongAnim;
    CCAnimation *topHitWrongAnim;
    
    
    CCLabelTTF *scoreLabel;
    int score;
    int totalSpawns;
    BOOL gameOver;
}

// returns a CCScene that contains the GameLayer as the only child
+(CCScene *) scene;

@end