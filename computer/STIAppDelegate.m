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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    /*
    //creamos un objeto del modelo
    STIcomputerModel * probook = [STIcomputerModel
                                  computerWithModelComputer: @"ProBook"
                                            computerCompany: @"HP"
                                                       type:@"Desktop"
                                                      notes:@"Esta computadora esta equipada con un gran monitor de resolucion intermedia incluye teclado numérico. Entre sus caracteristicas internas cuenta con 4GB de RAM (de origen) un procesador Intel Core 2 Duo de 64bits. Los discos duros para este tipo de equipos son con capacidades de almacenamiento  superiores a los 400 GB. Circuitos internos de alta resistencia capaces de soportar varios dias de arduo trabajo sin descanzo. Ademas de que la bateria con la que cuenta tiene una duracion de una semana si la computadora esta encendida pero sin consumir recursos y duracion de 4 dias si el equipo esta siendo usado al 100% de su capacidad. IDEAL PARA EL TRABAJO RUDO."
                                                    photo:nil
                                    keybordLanguaje: @[@"Latinoamericano"]
                                                   inches:17
                                                   rating:3
                                  computerCompanyWeb:[NSURL URLWithString:@"http://www.hp.com"]];
    
    STIcomputerModel * satellite = [STIcomputerModel
                                  computerWithModelComputer: @"Satellite"
                                  computerCompany: @"TOSHIBA"
                                  type:@"Laptop"
                                  notes:@"Esta computadora esta equipada con un gran monitor de resolucion intermedia incluye teclado numérico. Entre sus caracteristicas internas cuenta con 4GB de RAM (de origen) un procesador Intel Core 2 Duo de 64bits. Los discos duros para este tipo de equipos son con capacidades de almacenamiento  superiores a los 400 GB. Circuitos internos de alta resistencia capaces de soportar varios dias de arduo trabajo sin descanzo. Ademas de que la bateria con la que cuenta tiene una duracion de una semana si la computadora esta encendida pero sin consumir recursos y duracion de 4 dias si el equipo esta siendo usado al 100% de su capacidad. IDEAL PARA EL TRABAJO RUDO."
                                  photo:nil
                                  keybordLanguaje: @[@"Latinoamerica", @"Inglés", @"chino"]
                                  inches:15
                                  rating:2
                                  computerCompanyWeb:[NSURL URLWithString:@"http://www.toshiba.com"]];
    
    STIcomputerModel * vostro = [STIcomputerModel
                                    computerWithModelComputer: @"VOSTRO"
                                    computerCompany: @"DELL"
                                    type:@"Laptop"
                                    notes:@"Esta computadora esta equipada con un gran monitor de resolucion intermedia incluye teclado numérico. Entre sus caracteristicas internas cuenta con 4GB de RAM (de origen) un procesador Intel Core 2 Duo de 64bits. Los discos duros para este tipo de equipos son con capacidades de almacenamiento  superiores a los 400 GB. Circuitos internos de alta resistencia capaces de soportar varios dias de arduo trabajo sin descanzo. Ademas de que la bateria con la que cuenta tiene una duracion de una semana si la computadora esta encendida pero sin consumir recursos y duracion de 4 dias si el equipo esta siendo usado al 100% de su capacidad. IDEAL PARA EL TRABAJO RUDO."
                                    photo:nil
                                    keybordLanguaje: @[@"Español", @"Inglés", @"Portugués"]
                                    inches:17
                                    rating:5
                                    computerCompanyWeb:[NSURL URLWithString:@"http://www.dell.com"]];
    
    //creamos los controladores
    STIcomputerViewController *probookVC = [[STIcomputerViewController alloc] initWithModel:probook ];
    STIcomputerViewController *satelliteVC = [[STIcomputerViewController alloc] initWithModel:satellite ];
    STIcomputerViewController *vostroVC = [[STIcomputerViewController alloc] initWithModel:vostro];
    //STIWebViewController *browserVC = [[STIWebViewController alloc] initWithModel: probook];
    
    //creacion del combinador
   // UITabBarController *combinadorVC = [[UITabBarController alloc] init];
    //combinadorVC.viewControllers = @[computerVC, browserVC];
    UINavigationController *probookNC = [[UINavigationController alloc] initWithRootViewController:probookVC];
    UINavigationController *satelliteNC = [[UINavigationController alloc] initWithRootViewController:satelliteVC];
    UINavigationController *vostroNC = [[UINavigationController alloc] initWithRootViewController:vostroVC];
    
    
    //creamos el combinador
    UITabBarController *combinadorVC = [[UITabBarController alloc] init];
    combinadorVC.viewControllers = @[probookNC, satelliteNC, vostroNC];
    
    //asignamos el controlador creado como controlador Raiz
    //self.window.rootViewController = computerVC;
    //self.window.rootViewController = browserVC;
    self.window.rootViewController = combinadorVC;
    */
    
    
    //creamos el objeto del modelo
    STIComputerStoreModel *computerStore = [[STIComputerStoreModel alloc] init];
    
    //creamos el controlador
    STIcomputerStoreViewController *computerStoreVC = [[STIcomputerStoreViewController alloc] initWithModel:computerStore style:UITableViewStylePlain];
    
    //creamos el combinador (una navigation)
    UINavigationController * navVC = [[UINavigationController alloc] initWithRootViewController:computerStoreVC];
    
    //la definimos como controlador Raiz
    self.window.rootViewController = navVC;
    
    
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
