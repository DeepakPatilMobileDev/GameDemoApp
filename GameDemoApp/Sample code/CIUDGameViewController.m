//
//  CIUDGameViewController.m
//  PracticeProject
//
//  Created by Deepak P. Patil on 03/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import "CIUDGameViewController.h"
#import "CIUDGameController.h"
#import "Constants.h"
#import "CIUDBirdListLoader.h"

@interface CIUDGameViewController ()
@property (weak, nonatomic) IBOutlet CIUDPlayerButton *youButton;
@property (weak, nonatomic) IBOutlet CIUDPlayerButton *player2nd;
@property (weak, nonatomic) IBOutlet CIUDPlayerButton *player3rd;
@property (weak, nonatomic) IBOutlet CIUDPlayerButton *player4th;
@property (weak, nonatomic) IBOutlet CIUDPlayerButton *player5th;
@property (weak, nonatomic) IBOutlet CIUDPlayerButton *player6th;
@property (weak, nonatomic) IBOutlet CIUDPlayerButton *player7th;
@property (weak, nonatomic) IBOutlet CIUDPlayerButton *player8th;
@property (weak, nonatomic) IBOutlet UIImageView *birdImageView;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@end

@implementation CIUDGameViewController
int allPlayerCount;

CIUDGameController *gameController;
-(id)initWithPlayerCount:(int)playerCount{
    if (self =[super initWithNibName:@"CIUDGameViewController" bundle:nil]) {
        [CIUDBirdListLoader  sharedBirdLoader];
        gameController=[[CIUDGameController alloc] initWithPlayerCount:playerCount withGameViewDelegate:self];
        allPlayerCount=playerCount;
        [gameController setSpeed:1];
        [_counterLabel setHidden:YES];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_youButton setDelegate:self];
    [_player2nd setDelegate:self];
    [_player3rd setDelegate:self];
    [_player4th setDelegate:self];
    [_player5th setDelegate:self];
    [_player6th setDelegate:self];
    [_player7th setDelegate:self];
    [_player8th setDelegate:self];
    [_counterLabel setHidden:YES];
    [self startNewGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionCloseGame:(id)sender {
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Quit Game" message:@"Are you sure, you want to quit game." delegate:self cancelButtonTitle:nil otherButtonTitles:@"YES",@"NO", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0){
    if(buttonIndex==0){
        [self.navigationController popViewControllerAnimated:NO];
    }
}

-(void)startNewGame{
    [self updateUIAsPerPlayerCount];
    [gameController resetGameStates];
    [_youButton setBackgroundColor:[UIColor yellowColor]];
    [_player2nd setBackgroundColor:[UIColor yellowColor]];
    [_player3rd setBackgroundColor:[UIColor yellowColor]];
    [_player4th setBackgroundColor:[UIColor yellowColor]];
    [_player5th setBackgroundColor:[UIColor yellowColor]];
    [_player6th setBackgroundColor:[UIColor yellowColor]];
    [_player7th setBackgroundColor:[UIColor yellowColor]];
    [_player8th setBackgroundColor:[UIColor yellowColor]];
    
    [_youButton setCurrentPlayerState:kPlayerInActive];
    [_player2nd setCurrentPlayerState:kPlayerInActive];
    [_player3rd setCurrentPlayerState:kPlayerInActive];
    [_player4th setCurrentPlayerState:kPlayerInActive];
    [_player5th setCurrentPlayerState:kPlayerInActive];
    [_player6th setCurrentPlayerState:kPlayerInActive];
    [_player7th setCurrentPlayerState:kPlayerInActive];
    [_player8th setCurrentPlayerState:kPlayerInActive];
}


#pragma
#pragma ======================================================
#pragma ======================================================
#pragma mark -
#pragma ======================================================
#pragma ======================================================
-(void)updateUIAsPerPlayerCount{
    switch (allPlayerCount) {
        case 2:
            _player3rd.hidden=YES;
        case 3:
            _player4th.hidden=YES;
        case 4:
            _player5th.hidden=YES;
        case 5:
            _player6th.hidden=YES;
        case 6:
            _player7th.hidden=YES;
        case 7:
            _player8th.hidden=YES;
        case 8:
        default:
            break;
    }
}



-(void)blinkAnimation{
    CABasicAnimation *color = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    // animate from red to blue border ...
    color.fromValue = (id)[UIColor redColor].CGColor;
    color.toValue   = (id)[UIColor blueColor].CGColor;
    // ... and change the model value
    _youButton.layer.borderColor = [UIColor blueColor].CGColor;
    
    CABasicAnimation *width = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    // animate from 2pt to 4pt wide border ...
    width.fromValue = @2;
    width.toValue   = @4;
    // ... and change the model value
    _youButton.layer.borderWidth = 4;
    
    CAAnimationGroup *both = [CAAnimationGroup animation];
    // animate both as a group with the duration of 0.5 seconds
    both.duration   = 0.5;
    both.animations = @[color, width];
    // optionally add other configuration (that applies to both animations)
    both.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [_youButton.layer addAnimation:both forKey:@"color and width"];
}
#pragma
#pragma ======================================================
#pragma ======================================================
#pragma mark -
#pragma ======================================================
#pragma ======================================================
-(void)onFingerRaised:(CIUDPlayerButton *)playerBtn{
 DebugLog(@"%d",playerBtn.playerNumber);
}

-(void)onPlayerActivate:(CIUDPlayerButton *)playerBtn{
    DebugLog(@"%d",playerBtn.playerNumber);
    [gameController addNewActivePlayer];
}

#pragma
#pragma ======================================================
#pragma ======================================================
#pragma mark - Animations
#pragma ======================================================
#pragma ======================================================
-(void)playGameStartAnimation{
//UILabel *label
}

-(void)playGameResumeAnimation{
    
}

#pragma
#pragma ======================================================
#pragma ======================================================
#pragma mark - CIUDGameControllerDelegate Delegates
#pragma ======================================================
#pragma ======================================================

-(void)onGameStart{
 DebugLog(@"Starting game");
    [self performSelector:@selector(setCounterLabelText:) withObject:@"3" afterDelay:1];
    [self performSelector:@selector(setCounterLabelText:) withObject:@"2" afterDelay:2];
    [self performSelector:@selector(setCounterLabelText:) withObject:@"1" afterDelay:3];
    [self performSelector:@selector(setCounterLabelText:) withObject:@"0" afterDelay:4];
    
}
-(void)setCounterLabelText:(NSString *)str{
     DebugLog(@"");
    [self.counterLabel setHidden:NO];
    [self.counterLabel setText:str];
    if ([str isEqualToString:@"0"]) {
        [_counterLabel setHidden:YES];
    }
}

-(void)onshowBirdData:(NSDictionary *)birdDic{
 DebugLog(@"");
    [self.birdImageView setHidden:NO];
    [self.birdImageView setBackgroundColor:[UIColor redColor]];
    [self.birdImageView setAlpha:1.0];
    [self.view bringSubviewToFront:self.birdImageView ];
    [self.birdImageView  setImage:[UIImage imageNamed:[birdDic objectForKey:@"image"]]];
    
}
-(void)onTimeEnd{
 DebugLog(@"");
    
}
-(void)onGameEnd{
 DebugLog(@"");
    
}
@end
