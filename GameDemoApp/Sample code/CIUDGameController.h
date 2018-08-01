//
//  CIUDGameController.h
//  PracticeProject
//
//  Created by Deepak P. Patil on 03/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CIUDGameController;

@protocol CIUDGameControllerDelegate <NSObject>
-(void)onGameStart;
-(void)onshowBirdData:(NSDictionary *)birdDic;
-(void)onTimeEnd;
-(void)onGameEnd;
@end
@interface CIUDGameController : NSObject

@property(nonatomic,unsafe_unretained) id<CIUDGameControllerDelegate> gameViewDelegate;
-(id)initWithPlayerCount:(int)playerCount withGameViewDelegate:(id<CIUDGameControllerDelegate>) del;
-(void)addNewActivePlayer;
-(void)resetGameStates;
-(void)setSpeed:(float)speedSecs;
@end
