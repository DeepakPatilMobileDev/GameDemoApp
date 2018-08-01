//
//  CIUDPlayerButton.m
//  PracticeProject
//
//  Created by Deepak P. Patil on 06/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import "CIUDPlayerButton.h"
#import "Constants.h"
@implementation CIUDPlayerButton
@synthesize delegate,currentPlayerState;
BOOL isPlayerActivated;
-(id)init{
    if ([super init]) {
         DebugLog(@"");
        currentPlayerState=kPlayerInActive;
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
//     DebugLog(@"");
    currentPlayerState=kPlayerInActive;
    [self addTarget:self action:@selector(onTouchesStart) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(onTouchesEnd) forControlEvents:UIControlEventTouchUpInside];
}

-(void)onTouchesStart{
//    DebugLog(@"");
    if (delegate!=nil && currentPlayerState==kPlayerInActive) {
        if ([delegate respondsToSelector:@selector(onPlayerActivate:)]) {
            [delegate onPlayerActivate:self];
            currentPlayerState=kPlayerActive;
            [self setBackgroundColor: [UIColor orangeColor]];
        }
    }
}

-(void)onTouchesEnd{
//    DebugLog(@"");
    if (delegate!=nil) {
        if ([delegate respondsToSelector:@selector(onFingerRaised:)]) {
            [delegate onFingerRaised:self];
        }
    }
}

@end
