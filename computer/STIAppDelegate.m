//
//  STIAppDelegate.m
//  computer
//
//  Created by chuck davila rios on 27/02/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIAppDelegate.h"
#import "STIcomputerModel.h"
#import "STIcomputerViewController.h"
#import "STIWebViewController.h"

#import "STIComputerStoreModel.h"
#import "STIcomputerStoreViewController.h"

@implementation STIAppDelegate

-(UIViewController *) rootViewControllerForPhoneWithModel:(STIComputerStoreModel *) aModel
{
    //creamos el controlador
    STIcomputerStoreViewController *computerStoreVC = [[STIcomputerStoreViewController alloc] initWithModel:aModel style:UITableViewStylePlain];
    
    //creamos el navigation - combinador
    UINavigationController *computerStoreNav = [[UINavigationController alloc] initWithRootViewController:computerStoreVC];
    
    //asignamos el delegado
    computerStoreVC.delegate = computerStoreVC;

    return computerStoreNav;
}


-(UIViewController *) rootViewControllerForPadWithModel:(STIComputerStoreModel *)aModel
{
    //creamso los controladores
    STIcomputerStoreViewController *computerStoreVC = [[STIcomputerStoreViewController alloc] initWithModel:aModel style:UITableViewStylePlain];
    
    STIcomputerViewController *computerVC = [[STIcomputerViewController alloc] initWithModel:[computerStoreVC lastSelectedComputer]];
    
    //creamos los navigation
    UINavigationController *computerStoreNav = [[UINavigationController alloc] initWithRootViewController:computerStoreVC];
    
    UINavigationController *computerNav = [[UINavigationController alloc] initWithRootViewController:computerVC];
    
    //creamos el combinador
    UISplitViewController * splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[computerStoreNav, computerNav];
    
    //asignamos los delegados
    splitVC.delegate = computerVC;
    computerStoreVC.delegate = computerVC;

    return splitVC;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Creamos el modelo
    STIComputerStoreModel *computerStore = [[STIComputerStoreModel alloc] init];
    
    //configuramos controladores, combinadores y delegados
    //segun el tipo de dispositivo
    UIViewController *rootVC = nil;
    if (!IS_IPHONE) {
        //Tableta
        rootVC = [self rootViewControllerForPadWithModel:computerStore];
    }else{
        rootVC = [self rootViewControllerForPhoneWithModel:computerStore];
    }
    //definimos rootViewController
    self.window.rootViewController = rootVC;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
