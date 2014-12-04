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
        
        CCMenuItem *normalModeMenuItem = [CCMenuItemImage
                                    itemFromNormalImage:@"normalmode.jpg" selectedImage:@"normalmode_click.jpg"
                                    target:self selector:@selector(normalModeTapped:)];
        normalModeMenuItem.position = [self convertPoint:ccp(355, 195)];
        CCMenu *normalModeMenu = [CCMenu menuWithItems:normalModeMenuItem, nil];
        normalModeMenu.position = CGPointZero;
        [self addChild:normalModeMenu];
        
        CCMenuItem *hardModeMenuItem = [CCMenuItemImage
                                          itemFromNormalImage:@"hardmode.jpg" selectedImage:@"hardmode_click.jpg"
                                          target:self selector:@selector(hardModeTapped:)];
        hardModeMenuItem.position = [self convertPoint:ccp(355, 85)];
        CCMenu *hardModeMenu = [CCMenu menuWithItems:hardModeMenuItem, nil];
        hardModeMenu.position = CGPointZero;
        [self addChild:hardModeMenu];
                
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

- (void)normalModeTapped:(id)sender {
    AppController *myAppDelegate = [[UIApplication sharedApplication] delegate];
    myAppDelegate.gamemode = NORMAL;
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameLayer scene]]];
}

- (void)hardModeTapped:(id)sender {
    AppController *myAppDelegate = [[UIApplication sharedApplication] delegate];
    myAppDelegate.gamemode = HARD;
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameLayer scene]]];
}

-(void) onEnter
{
    [super onEnter];
}

-(void) dealloc
{
    //[CCAnimationCache purgeSharedAnimationCache];
    //[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
}
@end
