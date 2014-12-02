//
//  StartLayer.m
//  ChalkThrow
//
//  Created by 玲楠 卫 on 2/12/14.
//  Copyright (c) 2014年 Stella. All rights reserved.
//

#import "StartLayer.h"
#import "GameLayer.h"
#import "AppDelegate.h"

@implementation StartLayer

// Helper class method that creates a Scene with the GameLayer as the only child.
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    StartLayer *layer = [StartLayer node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}

//
-(id) init
{
    if( (self=[super init])) {
        
        NSString *startSheet = @"startscene.png";
        NSString *startPlist = @"startscene.plist";
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:startPlist];
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        CCSprite *bgd = [CCSprite spriteWithSpriteFrameName:@"startbackground.jpg"];
        bgd.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:bgd z:-2];
        
        CCSpriteBatchNode *normalModeNode = [CCSpriteBatchNode batchNodeWithFile:startSheet];
        [self addChild:normalModeNode z:3];
        CCSpriteBatchNode *hardModeNode = [CCSpriteBatchNode batchNodeWithFile:startSheet];
        [self addChild:hardModeNode z:1];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:startPlist];
        
        CCSprite *normalMode = [CCSprite spriteWithSpriteFrameName:@"normalmode.jpg"];
        normalMode.position = [self convertPoint:ccp(355, 195)];
        [normalModeNode addChild:normalMode];
        CCSprite *hardMode = [CCSprite spriteWithSpriteFrameName:@"hardmode.jpg"];
        hardMode.position = [self convertPoint:ccp(355, 85)];
        [hardModeNode addChild:hardMode];
        
        
    }
    
    return self;
}

- (CGPoint)convertPoint:(CGPoint)point {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return ccp(32+ point.x*2, 64+ point.y*2);
    } else {
        return point;
    }
}

-(void) onEnter
{
    [super onEnter];
    //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameLayer scene] ]];
}
@end
