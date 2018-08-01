//
//  AppDelegate.m
//  PracticeProject
//
//  Created by Deepak P. Patil on 03/06/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [UIWindow new];
    [self.window makeKeyAndVisible];
    self.window.frame = [[UIScreen mainScreen] bounds];
    
//    CALayer *layer = [self getGradientLayerForRect:self.window.bounds];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.window.bounds.size.width,self.window.bounds.size.height)];
    [bgView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"3.jpg"]]];
    
    UIView *bgView1 = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.window.bounds.size.width,self.window.bounds.size.height)];
    [bgView1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"2.jpg"]]];
    [bgView1 setAlpha:0.5];
    
    UIView *bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.window.bounds.size.width,self.window.bounds.size.height)];
    [bgView2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]]];
    [bgView2 setAlpha:0.1];
    
    UIImageView *bgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.window.bounds.size.width,self.window.bounds.size.height)];
    [bgView3 setImage:[UIImage imageNamed:@"4.jpg"]];
    [bgView3 setAlpha:0.75];
    
    UIView *cView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.window.bounds.size.width,self.window.bounds.size.height)];
    
    [cView addSubview:bgView];
    [cView addSubview:bgView1];
    [cView addSubview:bgView2];
    [cView addSubview:bgView3];
//    [bgView.layer addSublayer:layer];
    
    UIImage *bgImage = [self imageWithView:cView];
    
    
    self.window.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    
    
    UIViewController *controller=[[CIUDHomeViewController alloc]initWithNibName:@"CIUDHomeViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [navigationController setNavigationBarHidden:YES];
  
    [self.window setRootViewController:navigationController];
    
    
    
    return YES;
}
- (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.5);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (CAGradientLayer *)getGradientLayerForRect:(CGRect)rect{
    UIColor *C1 = [self colorForKey:@"160.0,51.0,147.0,1.0"];
    UIColor *C2 = [self colorForKey:@"228.0,331.0,39.0,0.7"];
    UIColor *C3 = [self colorForKey:@"160.0,51.0,147.0,1.0"];
    UIColor *C4 = [self colorForKey:@"228.0,331.0,39.0,0.7"];
    UIColor *C5 = [self colorForKey:@"228.0,331.0,39.0,0.7"];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = rect;
    
    gradient.colors = @[(id)C1.CGColor, (id)C2.CGColor,(id)C3.CGColor, (id)C4.CGColor, (id)C5.CGColor];
    [gradient setStartPoint:CGPointMake(0.0, 0.0)];
    [gradient setEndPoint:CGPointMake(1.0, 1.1)];
    [gradient setLocations:@[@0.0,@0.25,@0.5,@0.75,@1.0]];
    
    return gradient;
}

- (UIColor *)colorForKey:(NSString *)colorValue
{
    
        NSArray* array = [colorValue componentsSeparatedByString:@","];
        if (array && [array count] == 4) {
            return [UIColor colorWithRed:[array[0] floatValue]/255
                                   green:[array[1] floatValue]/255
                                    blue:[array[2] floatValue]/255
                                   alpha:[array[3] floatValue]];
        }
 
    
    return nil;
}


@end
