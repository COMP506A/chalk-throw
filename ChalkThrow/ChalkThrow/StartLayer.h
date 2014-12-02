//
//  StartLayer.h
//  ChalkThrow
//
//  Created by 玲楠 卫 on 2/12/14.
//  Copyright (c) 2014年 Stella. All rights reserved.
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// StartLayer
@interface StartLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{

}

// returns a CCScene that contains the GameLayer as the only child
+(CCScene *) scene;

@end
