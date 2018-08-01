//
//  CIUDLaunchViewController.m
//  PracticeProject
//
//  Created by Deepak P. Patil on 03/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import "CIUDHomeViewController.h"
#import "CIUDGameViewController.h"
#import "CIUDSelectPlayersViewController.h"
@interface CIUDHomeViewController ()

@end

@implementation CIUDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionPlayNow:(id)sender {
    CIUDSelectPlayersViewController *con=[[CIUDSelectPlayersViewController alloc] initWithNibName:@"CIUDSelectPlayersViewController" bundle:nil];
    [self.navigationController pushViewController:con animated:NO];
    
    
//    
//    CIUDGameViewController *con=[[CIUDGameViewController alloc] initWithNibName:@"CIUDGameViewController" bundle:nil];
//    [self.navigationController pushViewController:con animated:YES];
}

- (IBAction)actionConnectFacebook:(id)sender {
}
@end
