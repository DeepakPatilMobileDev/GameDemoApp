//
//  CIUDSelectPlayersControllerViewController.m
//  PracticeProject
//
//  Created by Deepak P. Patil on 03/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import "CIUDSelectPlayersViewController.h"
#import "CIUDGameViewController.h"
@interface CIUDSelectPlayersViewController ()

@end

@implementation CIUDSelectPlayersViewController

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

- (IBAction)actionPlayerCountSelected:(id)sender {
    UIButton *btn=(UIButton *)sender;
    NSLog(@"Selected Player Count %@",btn.titleLabel.text);
//    [self.navigationController popViewControllerAnimated:NO];
        CIUDGameViewController *con=[[CIUDGameViewController alloc] initWithPlayerCount:[btn.titleLabel.text intValue]];
        [self.navigationController pushViewController:con animated:NO];
    
}

- (IBAction)actionClose:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}
@end
