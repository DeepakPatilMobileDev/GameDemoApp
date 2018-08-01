//
//  CIUDGameController.m
//  PracticeProject
//
//  Created by Deepak P. Patil on 03/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import "CIUDGameController.h"
#import "Constants.h"
@implementation CIUDGameController
int numberofPlayer;
int activePlayersCount;
NSArray *gameImages;
GamesStates currentGameState;
int lastNumber;
float frequency;
@synthesize gameViewDelegate;

-(id)initWithPlayerCount:(int)playerCount withGameViewDelegate:(id<CIUDGameControllerDelegate>) del{
    if ([super init]) {
        numberofPlayer=playerCount;
        activePlayersCount=0;
        gameImages=[self getBirdsArray];
        lastNumber=-1;
        currentGameState=kGameStateNotStarted;
        gameViewDelegate=del;
    }
    return self;
}

-(void)startGame{
     DebugLog(@"");
    currentGameState=kGameStateStarted;
//    DebugLog(@"%d",[self getRandomNumberBetween:0 to:gameImages.count]);
    [self.gameViewDelegate onGameStart];
    [self performSelector:@selector(showNextImage) withObject:nil afterDelay:4];
    
}

-(void)showNextImage{
    NSDictionary *currentBirdDic=[gameImages objectAtIndex:[self getRandomNumberBetween:0 to:gameImages.count]];
    if (self.gameViewDelegate!=nil) {
        [self.gameViewDelegate onshowBirdData:currentBirdDic];
    }
    [self performSelector:@selector(showNextImage) withObject:nil afterDelay:frequency];
}

-(void)addNewActivePlayer{
    if (currentGameState==kGameStateNotStarted) {
        activePlayersCount++;
        DebugLog(@"activePlayersCount %d",activePlayersCount);
        if (activePlayersCount==numberofPlayer) {
            [self startGame];
        }
    }
}

-(void)resetGameStates{
    activePlayersCount=0;
    lastNumber=-1;
    currentGameState=kGameStateNotStarted;
}

-(GamesStates)getCurrentGameState{
    return currentGameState;
}

-(void)setSpeed:(float)speedSecs{
    frequency=speedSecs;
}

#pragma
#pragma ======================================================
#pragma ======================================================
#pragma mark -
#pragma ======================================================
#pragma ======================================================


- (NSArray*)getBirdsArray{

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BirdsList" ofType:@"plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return [NSArray arrayWithContentsOfFile:filePath];
    }
    
    return nil;
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
   int newNumber= (int)from + arc4random() % (to-from);
    if (lastNumber== newNumber) {
        newNumber= [self getRandomNumberBetween:from to:to];
    }
    lastNumber=newNumber;
    return newNumber;
}
@end
