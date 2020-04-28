//
//  AppDelegate.swift
//  JSON_Parser
//
//  Created by Kedar Sukerkar on 28/04/20.
//  Copyright © 2020 Kedar-27. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK: AppDelegate Lifecycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.setupInitialVC()
        return true
    }

    // MARK: - Setup Initial VC
    func setupInitialVC(){
        let cardsVC = CardsVC()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = cardsVC
        self.window?.makeKeyAndVisible()
    }
    

    


}

