//
//  MyScene.m
//  ChalkThrow
//
//  Created by Stella on 14/11/30.
//  Copyright (c) 2014年 Stella. All rights reserved.
//

// Import the interfaces
#import "MyScene.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation MyScene

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    MyScene *layer = [MyScene node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    // always call "super" init
    // Apple recommends to re-assign "self" with the "super's" return value
    if( (self=[super init]) ) {
        
        // Determine names of sprite sheets and plists to load
        NSString *bgSheet = @"background.png";
        NSString *bgPlist = @"background.plist";
        NSString *sSheet = @"sprites.png";
        NSString *sPlist = @"sprites.plist";
        NSString *tbSheet = @"tables.png";
        NSString *tbPlist = @"tables.plist";
        
        
        // Load background and foreground
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:bgPlist];
        
        // Add background
        CGSize winSize = [CCDirector sharedDirector].winSize;
        CCSprite *bgd = [CCSprite spriteWithSpriteFrameName:@"background_rmTables.jpg"];
        bgd.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:bgd z:-2];
        
        // Load tables
        CCSpriteBatchNode *bottomTableNode = [CCSpriteBatchNode batchNodeWithFile:tbSheet];
        [self addChild:bottomTableNode z:3];
        CCSpriteBatchNode *topTableNode = [CCSpriteBatchNode batchNodeWithFile:tbSheet];
        [self addChild:topTableNode z:1];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:tbPlist];
        
        // Add tables
        CCSprite *bottomTableLeft = [CCSprite spriteWithSpriteFrameName:@"b_l.png"];
        bottomTableLeft.position = [self convertPoint:ccp(85, 85)];
        [bottomTableNode addChild:bottomTableLeft];
        
        CCSprite *bottomTableMiddle = [CCSprite spriteWithSpriteFrameName:@"b_m.png"];
        bottomTableMiddle.position = [self convertPoint:ccp(240, 85)];
        [bottomTableNode addChild:bottomTableMiddle];
        
        CCSprite *bottomTableRight = [CCSprite spriteWithSpriteFrameName:@"b_r.png"];
        bottomTableRight.position = [self convertPoint:ccp(395, 85)];
        [bottomTableNode addChild:bottomTableRight];
        
        CCSprite *topTableLeft = [CCSprite spriteWithSpriteFrameName:@"t_l.png"];
        topTableLeft.position = [self convertPoint:ccp(115, 195)];
        [topTableNode addChild:topTableLeft];
        
        CCSprite *topTableMiddle = [CCSprite spriteWithSpriteFrameName:@"t_m.png"];
        topTableMiddle.position = [self convertPoint:ccp(240, 195)];
        [topTableNode addChild:topTableMiddle];
        
        CCSprite *topTableRight = [CCSprite spriteWithSpriteFrameName:@"t_r.png"];
        topTableRight.position = [self convertPoint:ccp(355, 195)];
        [topTableNode addChild:topTableRight];
        
        
        
        // Load sprites
        CCSpriteBatchNode *bottomSpriteNode = [CCSpriteBatchNode batchNodeWithFile:sSheet];
        [self addChild:bottomSpriteNode z:2];
        CCSpriteBatchNode *topSpriteNode = [CCSpriteBatchNode batchNodeWithFile:sSheet];
        [self addChild:topSpriteNode z:0];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:sPlist];
        
        students = [[NSMutableArray alloc] init];
        
        CCSprite *bottomStudentLeft = [CCSprite spriteWithSpriteFrameName:@"normal_l.png"];
        bottomStudentLeft.position = [self convertPoint:ccp(95, 155)];
        [bottomSpriteNode addChild:bottomStudentLeft];
        [bottomStudentLeft setUserData:@"00"];      //1st position: 0-sit, 1-sleep
        [students addObject:bottomStudentLeft];     //2nd position: 0-bottom, 1-top
        
        CCSprite *bottomStudentMiddle = [CCSprite spriteWithSpriteFrameName:@"normal_l.png"];
        bottomStudentMiddle.position = [self convertPoint:ccp(240, 155)];
        [bottomSpriteNode addChild:bottomStudentMiddle];
        [bottomStudentMiddle setUserData:@"00"];
        [students addObject:bottomStudentMiddle];
        
        CCSprite *bottomStudentRight = [CCSprite spriteWithSpriteFrameName:@"normal_l.png"];
        bottomStudentRight.position = [self convertPoint:ccp(385, 155)];
        [bottomSpriteNode addChild:bottomStudentRight];
        [bottomStudentRight setUserData:@"00"];
        [students addObject:bottomStudentRight];

        CCSprite *topStudentLeft = [CCSprite spriteWithSpriteFrameName:@"normal_s.png"];
        topStudentLeft.position = [self convertPoint:ccp(130, 250)];
        [topSpriteNode addChild:topStudentLeft];
        [topStudentLeft setUserData:@"01"];
        [students addObject:topStudentLeft];
        
        CCSprite *topStudentMiddle = [CCSprite spriteWithSpriteFrameName:@"normal_s.png"];
        topStudentMiddle.position = [self convertPoint:ccp(240, 250)];
        [topSpriteNode addChild:topStudentMiddle];
        [topStudentMiddle setUserData:@"01"];
        [students addObject:topStudentMiddle];
        
        CCSprite *topStudentRight = [CCSprite spriteWithSpriteFrameName:@"normal_s.png"];
        topStudentRight.position = [self convertPoint:ccp(340, 250)];
        [topSpriteNode addChild:topStudentRight];
        [topStudentRight setUserData:@"01"];
        [students addObject:topStudentRight];
        
        
        // load animations
        bottomSittingAnim = [self animationFromPlist:@"bottomSittingAnim" delay:0.1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:bottomSittingAnim name:@"bottomSittingAnim"];
        topSittingAnim = [self animationFromPlist:@"topSittingAnim" delay:0.1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:topSittingAnim name:@"topSittingAnim"];
        bottomSleepAnim = [self animationFromPlist:@"bottomSleepAnim" delay:0.3];
        [[CCAnimationCache sharedAnimationCache] addAnimation:bottomSleepAnim name:@"bottomSleepAnim"];
        topSleepAnim = [self animationFromPlist:@"topSleepAnim" delay:0.3];
        [[CCAnimationCache sharedAnimationCache] addAnimation:topSleepAnim name:@"topSleepAnim"];
        
        [self schedule:@selector(tryBlinking:) interval:0.5];
        
        // Load Chalk
        self.touchEnabled = true;
        _chalks = [[NSMutableArray alloc] init];
        [self schedule:@selector(update:)];
        
        //[self schedule:@selector(update:)];
        
        /*
        float margin =10;
        label = [CCLabelTTF labelWithString:@"Score: 0" fontName:@"Verdana" fontSize:[self convertFontSize:14.0]];
        label.anchorPoint = ccp(1, 0);
        label.position = ccp(winSize.width - margin, margin);
        [self addChild:label z:10];
        
        
        [self schedule:@selector(tryPopMoles:) interval:0.5];
         */
        
    }
    return self;
}


- (CCAnimation *)animationFromPlist:(NSString *)animPlist delay:(float)delay {
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:animPlist ofType:@"plist"]; // 1
    NSArray *animImages = [NSArray arrayWithContentsOfFile:plistPath]; // 2
    NSMutableArray *animFrames = [NSMutableArray array]; // 3
    for(NSString *animImage in animImages) { // 4
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:animImage]]; // 5
    }
    return [CCAnimation animationWithFrames:animFrames delay:delay]; // 6
    
}


/*-(void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:kCCMenuTouchPriority swallowsTouches:NO];
}*/


/*-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    for (CCSprite *mole in students) {
        if (mole.userData == FALSE) continue;
        if (CGRectContainsPoint(mole.boundingBox, touchLocation)) {
            
            mole.userData = FALSE;
            score+=10;
            
            [mole stopAllActions];
            CCAnimate *hit = [CCAnimate actionWithAnimation:hitAnim restoreOriginalFrame:NO];
            CCMoveBy *moveDown = [CCMoveBy actionWithDuration:0.2 position:ccp(0, -mole.contentSize.height)];
            CCEaseInOut *easeMoveDown = [CCEaseInOut actionWithAction:moveDown rate:3.0];
            [mole runAction:[CCSequence actions:hit, easeMoveDown, nil]];
        }
    }
    return TRUE;
}*/

- (void) spriteMoveFinished: (id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if(sprite.tag ==2) {
        [_chalks removeObject:sprite];
    }
    [self removeChild:sprite cleanup:YES];
}

CGPoint location;
- (void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // Choose one of the touches to work with
    UITouch *touch = [touches anyObject];
    location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    // Set up initial location of chalk
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCSprite *chalk = [CCSprite spriteWithFile:@"chalk.png"
                                          rect:CGRectMake(0, 0, 96, 48)];
    chalk.position = ccp(winSize.width/2, 24);
    
    // Determine offset of location to chalk
    /*int offX = location.x - chalk.position.x;
    int offY = location.y - chalk.position.y;
    
    // Ok to add now - we've double checked position
    [self addChild:chalk z:10];
    
    if (offY < chalk.position.y)
        return;
    
    int offRealX, offRealY;
    CGPoint realDest;
    if (offX > 0) {
        // Determine where we wish to shoot the chalk to
        int realX = winSize.width + (chalk.contentSize.width/2);
        offRealX = realX - chalk.position.x;
        float ratio = (float) offY / (float) offX;
        int realY = (offRealX * ratio) + chalk.position.y;
        realDest = ccp(realX, realY);
    
        // Determine the length of how far we're shooting
        offRealY = realY - chalk.position.y;
    } else {
        // Determine where we wish to shoot the chalk to
        int realX = - chalk.contentSize.width/2;
        offRealX = realX - chalk.position.x;
        float ratio = (float) offY / (float) offX;
        int realY = (offRealX * ratio) + chalk.position.y;
        realDest = ccp(realX, realY);
        
        // Determine the length of how far we're shooting
        offRealY = realY - chalk.position.y;
    }
    
    float length = sqrtf((offRealX * offRealX) + (offRealY * offRealY));
    float velocity = 480/1; // 480pixels/1sec
    float realMoveDuration = length/velocity;
    
    chalk.tag = 2;
    [_chalks addObject:chalk];
    
    float realScale = 1 - length/640*0.6;
    // Move chalk to actual endpoint
    CCMoveTo* moveTo = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    [chalk runAction:[CCSpawn actions:
                           [CCMoveTo actionWithDuration:realMoveDuration position:realDest],
                           [CCScaleBy actionWithDuration:realMoveDuration scale:realScale],
                           [CCRotateBy actionWithDuration:realMoveDuration angle:720],
                           [CCEaseOut actionWithAction:moveTo rate:0.8],
                           nil]];*/
    if (location.y < 500) {
        int offX = location.x - chalk.position.x;
        int offY = location.y - chalk.position.y;
        
        [self addChild:chalk z:10];
        
        if (offY < 0)
            return;
        
        float length = sqrtf((offX * offX) + (offY * offY));
        float velocity = 480/1;
        float moveDuration = length / velocity;
        
        
        chalk.tag = 2;
        [_chalks addObject:chalk];
        
        float scale = 1 - length/640*0.6;
        
        CCMoveTo* moveTo = [CCMoveTo actionWithDuration:moveDuration position:location];
        [chalk runAction: [CCSpawn actions:
                           [CCMoveTo actionWithDuration:moveDuration position:location],
                           [CCScaleBy actionWithDuration:moveDuration scale:scale],
                           [CCRotateBy actionWithDuration:moveDuration angle:720],
                           [CCEaseOut actionWithAction:moveTo rate:1],
                           nil]];

    } else {
        float sx = chalk.position.x;
        float sy = chalk.position.y;
        float ex = location.x;
        float ey = location.y;
        
        [self addChild:chalk z:10];
        chalk.tag = 2;
        [_chalks addObject:chalk];

        //int h = [chalk contentSize].height * 0.5;
        ccBezierConfig bezier; // 创建贝塞尔曲线
        bezier.controlPoint_1 = ccp(sx + 50, sy + 100); // 起始点
        bezier.controlPoint_2 = ccp(ex + 100, ey + 300); //控制点
        bezier.endPosition = ccp(location.x, location.y); // 结束位置
        CCBezierTo *actionMove = [CCBezierTo actionWithDuration:1 bezier:bezier];
        [chalk runAction:actionMove];
    }
    
    //[self delete:chalk];
}

- (void)update:(ccTime)dt {
    
    NSMutableArray *chalksToDelete = [[NSMutableArray alloc] init];
    for (CCSprite *chalk in _chalks) {
        CGRect chalkRect = CGRectMake(
                                           chalk.position.x - (chalk.contentSize.width/2),
                                           chalk.position.y - (chalk.contentSize.height/2),
                                           chalk.contentSize.width,
                                           chalk.contentSize.height);
        
        //NSMutableArray *targetsToDelete = [[NSMutableArray alloc] init];
        for (CCSprite *target in students) {
            CGRect targetRect = CGRectMake(
                                           target.position.x - (target.contentSize.width/2),
                                           target.position.y,
                                           target.contentSize.width,
                                           target.contentSize.height/2);
            /*if (CGRectIntersectsRect(chalkRect, targetRect)) {
                [chalksToDelete addObject:chalk];
            }*/
            CCSprite *markTarget = nil;
            CGRect markTargetRect;
            if (location.x > (target.position.x - (target.contentSize.width/2)) &&
                location.y > (target.position.y - (target.contentSize.height/2)) &&
                location.x < (target.position.x - (target.contentSize.width/2) + target.contentSize.width) &&
                location.y < (target.position.y - (target.contentSize.height/2) + target.contentSize.height)){
                markTarget = target;
                markTargetRect = targetRect;
            }
            
            if (markTarget) {
                if (CGRectIntersectsRect(chalkRect, targetRect)) {
                    [chalksToDelete addObject:chalk];
                }
            }
        }
    }
        
    for (CCSprite *chalk in chalksToDelete) {
        [_chalks removeObject:chalk];
        [self removeChild:chalk cleanup:YES];
    }
    [chalksToDelete release];
        
        /*
        NSMutableArray *targetsToDelete = [[NSMutableArray alloc] init];
        for (CCSprite *target in _targets) {
            CGRect targetRect = CGRectMake(
                                           target.position.x - (target.contentSize.width/2),
                                           target.position.y - (target.contentSize.height/2),
                                           target.contentSize.width,
                                           target.contentSize.height);
            
            if (CGRectIntersectsRect(projectileRect, targetRect)) {
                [targetsToDelete addObject:target];
            }
        }
        
        for (CCSprite *target in targetsToDelete) {
            [_targets removeObject:target];
            [self removeChild:target cleanup:YES];
        }
        
        //因为在遍历_projectiles，不能直接把projectiles移除
        if (targetsToDelete.count >0) {
            [projectilesToDelete addObject:projectile];
        }
        [targetsToDelete release];
    }
    
    for (CCSprite *chalk in chalksToDelete) {
        [_chalks removeObject:chalk];
        [self removeChild:chalk cleanup:YES];
    }
    [chalksToDelete release];*/
}


- (void) tryBlinking:(ccTime)dt {
    /*
    if (gameOver) return;
    
    [label setString:[NSString stringWithFormat:@"Score: %d", score]];
    
    if (totalSpawns >=50) {
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        CCLabelTTF *goLabel = [CCLabelTTF labelWithString:@"Level Complete!" fontName:@"Verdana" fontSize:[self convertFontSize:48.0]];
        goLabel.position = ccp(winSize.width/2, winSize.height/2);
        goLabel.scale =0.1;
        [self addChild:goLabel z:10];
        [goLabel runAction:[CCScaleTo actionWithDuration:0.5 scale:1.0]];
        
        gameOver =true;
        return;
    }
     */
    
    for (CCSprite *student in students) {
        if (arc4random() % 3 == 0) {
            if (student.numberOfRunningActions == 0) {
                [self blinking:student];
            }
        }
    }
    
}



- (void)setSleep:(id)sender {
    CCSprite *student = (CCSprite *)sender;
    if (student.userData == @"00") {        //1st position: 0-sit, 1-sleep
        [student setUserData:@"10"];        //2nd position: 0-bottom, 1-top
    }
    if (student.userData == @"01") {
        [student setUserData:@"11"];
    }
}

- (void)unsetSleep:(id)sender {
    CCSprite *student = (CCSprite *)sender;
    if (student.userData == @"10") {        //1st position: 0-sit to hit, 1-sleep
        [student setUserData:@"00"];        //2nd position: 0-bottom, 1-top
    }
    if (student.userData == @"11") {
        [student setUserData:@"01"];
    }
}
 

- (void) blinking:(CCSprite *)student {
    
    if (student.userData == @"00") {
        [student setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"normal_l.png"]];
        CCCallFunc *setSleep = [CCCallFuncN actionWithTarget:self selector:@selector(setSleep:)]; //set tappable
        CCAnimate *blink = [CCAnimate actionWithAnimation:bottomSittingAnim restoreOriginalFrame:YES];
        CCAnimate *sleep = [CCAnimate actionWithAnimation:bottomSleepAnim restoreOriginalFrame:YES];
        CCCallFunc *unsetSleep = [CCCallFuncN actionWithTarget:self selector:@selector(unsetSleep:)]; //unset tappable

        [student runAction:[CCSequence actions: blink, setSleep, sleep, unsetSleep, nil]];
    }
    if (student.userData == @"01") {
        [student setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"normal_s.png"]];
        CCCallFunc *setSleep = [CCCallFuncN actionWithTarget:self selector:@selector(setSleep:)]; //set tappable
        CCAnimate *blink = [CCAnimate actionWithAnimation:topSittingAnim restoreOriginalFrame:YES];
        CCAnimate *sleep = [CCAnimate actionWithAnimation:topSleepAnim restoreOriginalFrame:YES];
        CCCallFunc *unsetSleep = [CCCallFuncN actionWithTarget:self selector:@selector(unsetSleep:)]; //unset tappable
        
        [student runAction:[CCSequence actions: blink, setSleep, sleep, unsetSleep, nil]];
    }
    
    
    /*
    if (totalSpawns > 50) return;
    totalSpawns++;
    
    
    [mole setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"normal_l.png"]];
    
    // Pop mole
    CCMoveBy *moveUp = [CCMoveBy actionWithDuration:0.2 position:ccp(0, mole.contentSize.height)];
    CCCallFunc *setTappable = [CCCallFuncN actionWithTarget:self selector:@selector(setTappable:)]; //set tappable
    CCEaseInOut *easeMoveUp = [CCEaseInOut actionWithAction:moveUp rate:3.0];
    CCAnimate *laugh = [CCAnimate actionWithAnimation:laughAnim restoreOriginalFrame:YES];
    
    CCCallFunc *unsetTappable = [CCCallFuncN actionWithTarget:self selector:@selector(unsetTappable:)]; //unset tappable
    CCAction *easeMoveDown = [easeMoveUp reverse];
    
    [mole runAction:[CCSequence actions:easeMoveUp, setTappable, laugh, unsetTappable, easeMoveDown, nil]];
    */
}

- (CGPoint)convertPoint:(CGPoint)point {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return ccp(32+ point.x*2, 64+ point.y*2);
    } else {
        return point;
    }
}

- (float)convertFontSize:(float)fontSize {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return fontSize *2;
    } else {
        return fontSize;
    }
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    // in case you have something to dealloc, do it in this method
    // in this particular example nothing needs to be released.
    // cocos2d will automatically release all the children (Label)
    
    // don't forget to call "super dealloc"
    [super dealloc];
    [students release];
    students = nil;
    [_chalks release];
    _chalks = nil;
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
    AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
    [[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
    [[app navController] dismissModalViewControllerAnimated:YES];
}
@end
