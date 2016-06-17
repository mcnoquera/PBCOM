//
//  AppDelegate.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/7/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let cColor = CustomColor()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        /*
        * Setup UITabBarController
        **/
        
        let tabBarController = self.window!.rootViewController as! UITabBarController
        var imageArray = ["Account","Payment","Transaction", "More"]
        let tabItems   = tabBarController.tabBar.items!
        for (index, _) in imageArray.enumerate() {
    
            let unselectedItem: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            let selectedItem: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            tabItems[index].image = UIImage(named: imageArray[index])?.imageWithRenderingMode(.AlwaysOriginal)
            
            tabItems[index].setTitleTextAttributes(unselectedItem as? [String : AnyObject], forState: .Normal)
            tabItems[index].setTitleTextAttributes(selectedItem as? [String : AnyObject], forState: .Selected)
            
            tabItems[index].selectedImage = UIImage(named: imageArray[index])?.imageWithRenderingMode(.AlwaysOriginal)
        }
        
        let numberOfItems = CGFloat(tabBarController.tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBarController.tabBar.frame.width / numberOfItems, height: tabBarController.tabBar.frame.height)
        tabBarController.tabBar.selectionIndicatorImage = UIImage.imageWithColor(cColor.selectedTabItemColor(), size: tabBarItemSize).resizableImageWithCapInsets(UIEdgeInsetsZero)
        
        tabBarController.tabBar.frame.size.width = (self.window?.rootViewController?.view.frame.width)! + 4
        tabBarController.tabBar.frame.origin.x = -2
        
        tabBarController.tabBar.translucent = false
        tabBarController.selectedIndex = 0
        tabBarController.tabBar.clipsToBounds = true
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

