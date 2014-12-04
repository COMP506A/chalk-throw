//
//  AppDelegate.h
//  ChalkThrow
//
//  Created by Stella on 14/11/30.
//  Copyright Stella 2014年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

#define NORMAL 0
#define HARD 1

// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property int gamemode;

@end
