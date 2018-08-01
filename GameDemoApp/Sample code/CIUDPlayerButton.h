//
//  CIUDPlayerButton.h
//  PracticeProject
//
//  Created by Deepak P. Patil on 06/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"


@class CIUDPlayerButton;

@protocol CIUDPlayerButtonDelegate <NSObject>
-(void)onFingerRaised:(CIUDPlayerButton*)playerBtn;
-(void)onPlayerActivate:(CIUDPlayerButton*)playerBtn;
@end

@interface CIUDPlayerButton : UIButton
@property(nonatomic,unsafe_unretained) id<CIUDPlayerButtonDelegate> delegate;
@property (nonatomic,readonly) IBInspectable int playerNumber;

@property (nonatomic,readwrite) PlayerStatus currentPlayerState;

@end
