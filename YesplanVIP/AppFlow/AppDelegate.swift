////
////  AppDelegate.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 13/08/18.
////  Copyright © 2018 Yesplan. All rights reserved.
//// https://dewerft.yesplan.be/api/events?api_key=C857C01360BB5777DABE5B7EE6594CD1"
//// cd ~/Library/Mobile\ Documents/com~apple~CloudDocs
//// dewerft.yesplan.be
//// C857C01360BB5777DABE5B7EE6594CD1
//// 190813697-1478707406 id Tom
//// Sourcery.app/Contents/MacOS/Sourcery --sources Test.swift --templates Templates/AutoCodable.swifttemplate --output ./Generated --disableCache --verbose

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func requestNotificationAuthorization(application: UIApplication) {
        
        let center =  UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        center.requestAuthorization(options: options) { (granted, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        api = Yesplan()
//        UIApplication
//            .sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        //        ShortcutParser.shared.registerShortcuts()
        
        // Create a new window for the window property that
        // comes standard on the AppDelegate class. The UIWindow
        // is where all view controllers and views appear.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Set the initial View Controller to  instance of ViewController
        window?.rootViewController = RootViewController()
        
        // Present the window
        window?.makeKeyAndVisible()
        
        requestNotificationAuthorization(application: application)
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        AppConfig.shared.setAppInfo()
        UIApplication.shared.applicationIconBadgeNumber = 0
        NotificationCenter.default.post(name: Notifications.viewActive.name, object: nil)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        UserDefaults.standard.synchronize()
    }
    
    //    func applicationDidBecomeActive(_ application: UIApplication) {
    //        // handle any deeplink
    //        Deeplinker.checkDeepLink()
    //    }
    
    // MARK: Shortcuts
    //    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
    //        completionHandler(Deeplinker.handleShortcut(item: shortcutItem))
    //    }
}

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var rootViewController: RootViewController {
        return window!.rootViewController as! RootViewController
    }
    
    var URL: String {
        let url: String = String()
        return url
    }
    var Key: String {
        let key: String = String()
        return key
    }
}
