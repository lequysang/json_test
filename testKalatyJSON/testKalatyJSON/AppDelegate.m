//
//  AppDelegate.m
//  testKalatyJSON
//
//  Created by Sang Quý Lê on 3/1/13.
//  Copyright (c) 2013 lequysang. All rights reserved.
//

#import "AppDelegate.h"
//#define kLatestKivaLoansURL [NSURL URLWithString: @"http://sabeelonet.com/Infomist/productDetail.json"] //1
//
//#define kLatestKivaLoansURL_Two [NSURL URLWithString: @"http://infomist.net/kalaty/complete_jason.php"] //2

#define kLatestKivaLoansURL [NSURL URLWithString: @"https://raw.github.com/lequysang/json_test/master/outCorrect2.json"] //2
//#define kLatestKivaLoansURLTwo [NSURL URLWithString: @"https://raw.github.com/lequysang/json_test/master/outCorrect.json"] //2

#define kLatestKivaLoansURLTwo [NSURL URLWithString: @"https://raw.github.com/lequysang/json_test/master/newTest.json"] //2

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"ONE= OK LINK===============================================================");
    [self fetchJSONDataToArrayFromURL:kLatestKivaLoansURLTwo];
    
//    [self fetchJSONDataToArrayFromURLTwo:kLatestKivaLoansURLTwo];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void) fetchJSONDataToArrayFromURL:(NSURL *)jsonURL{
    NSError* dataError;
    NSData* data = [NSData dataWithContentsOfURL:jsonURL options:NSDataReadingMappedIfSafe error:&dataError];
    if (!dataError) {
        NSError* jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&jsonError];
        if (!jsonError) {
            NSLog(@"%@",json);
            NSArray *productsArray = [json objectForKey:@"Response"];
            NSDictionary *product = [productsArray objectAtIndex:0];
//            NSString *product_id = [product valueForKey:@"category_id"];
            NSLog(@"%@",product);
        }
        else {
            NSLog(@"ERROR: %@",jsonError);
        }
    }else{
        NSLog(@"ERROR: %@",dataError);
    }
}

-(void) fetchJSONDataToArrayFromURLTwo:(NSURL *)jsonURL{
    NSError* dataError;
    NSData* data = [NSData dataWithContentsOfURL:jsonURL options:NSDataReadingMappedIfSafe error:&dataError];
    if (!dataError) {
        NSError* jsonError;
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&jsonError];
        if (!jsonError) {
//            NSArray *productsArray = [json valueForKey:@"p"];
            NSDictionary *product = [json objectAtIndex:0];
            NSString *product_id = [product valueForKey:@"category_id"];
            NSLog(@"%@",product_id);
        }
        else {
            NSLog(@"ERROR: %@",jsonError);
        }
    }else{
        NSLog(@"ERROR: %@",dataError);
    }
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
