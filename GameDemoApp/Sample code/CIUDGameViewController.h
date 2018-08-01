//
//  CIUDGameViewController.h
//  PracticeProject
//
//  Created by Deepak P. Patil on 03/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CIUDPlayerButton.h"
#import "CIUDGameController.h"

@interface CIUDGameViewController : UIViewController <UIAlertViewDelegate,CIUDPlayerButtonDelegate,CIUDGameControllerDelegate>
- (IBAction)actionCloseGame:(id)sender;
-(id)initWithPlayerCount:(int)playerCount;
@end
