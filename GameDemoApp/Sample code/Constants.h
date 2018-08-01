//
//  Constants.h
//  PracticeProject
//
//  Created by Deepak P. Patil on 06/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//



#define DEBUG_MODE          YES

#ifdef DEBUG_MODE
#   define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define DebugLog(...)
#endif

#define FREQUENCY_MAX 1.0

typedef enum GamesStates{
    kGameStateNotStarted,
    kGameStateStarted,
    kGameStatePaused,
    kGameStateEnded
    
}GamesStates;

typedef enum PlayerStatus{
    kPlayerInActive,
    kPlayerActive,
    kPlayerLost,
    kPlayerQuit,
}PlayerStatus;