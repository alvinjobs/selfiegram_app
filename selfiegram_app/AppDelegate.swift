//
//  AppDelegate.swift
//  selfiegram_app
//
//  Created by Alvin Phun on 2018-09-26.
//  Copyright © 2018 Alvin Phun. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Initialise Parse
        let configuration = ParseClientConfiguration {
            clientConfiguration in
                clientConfiguration.applicationId = "selfiegrams-alvin"
                clientConfiguration.server = "https://selfiegrams.herokuapp.com/parse"
        }
        
        Post.registerSubclass()
        Activity.registerSubclass()
        Parse.initialize(with: configuration)
        
        let user = PFUser()
        let username = "alvin"
        let password = "jobs"
        user.username = username
        user.password = password
        user.signUpInBackground(block: {(success, error) -> Void in
            
            if success {
                print("successfully signed up a user")
            } else {
                PFUser.logInWithUsername(inBackground: username, password: password, block: {(user, error) -> Void in
                    if let user = user {
                        print("successfully logged in \(user)")
                    }
                })
            }
        })
        
//        // A PFObject is an object that we can add or modify in Parse.
//        // We are adding an object of class type TestObject
//        let testObject = PFObject(className: "TestObject")
//
//        // We are setting the foo property on our object to be equal to bar
//        testObject["foo"] = "bar"
//
//        // We are saving our object to Parse
//        testObject.saveInBackground (block: { (success: Bool, error: Error?) -> Void in
//
//            if success {
//
//            print("Object has been saved.")
//            }
//        })

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

