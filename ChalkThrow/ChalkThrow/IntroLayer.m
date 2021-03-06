//
//  IntroLayer.m
//  ChalkThrow
//
//  Created by Stella on 14/11/30.
//  Copyright Stella 2014年. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "StartLayer.h"
#import "GameLayer.h"

// Need to add sound
#import "SimpleAudioEngine.h"


#pragma mark - IntroLayer

// Intorlayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the GameLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(id) init
{
	if( (self=[super init])) {
        // Load sound effect 
        [self loadSoundEffect];
        [[SimpleAudioEngine sharedEngine] playEffect:@"flash.mp3"];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

		CCSprite *background;
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
			background = [CCSprite spriteWithFile:@"Default.png"];
			background.rotation = 90;
		} else {
			background = [CCSprite spriteWithFile:@"Default_landscape.png"];
		}
		background.position = ccp(size.width/2, size.height/2);

		// add the label as a child to this Layer
		[self addChild: background];
	}
	
	return self;
}

// Load sound effect
- (void) loadSoundEffect {
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"flash.mp3"];
}

-(void) onEnter
{
	[super onEnter];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFadeTR transitionWithDuration:1.0 scene:[StartLayer scene]]];
}
@end
