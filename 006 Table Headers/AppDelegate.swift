//
//  AppDelegate.swift
//  006 Table Headers
//
//  Created by Aaron Brethorst on 1/30/18.
//  Copyright © 2018 Quickbytes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let window = UIWindow.init(frame: UIScreen.main.bounds)
    let tabBar = UITabBarController.init()
    let defaultHeadersController = DefaultViewController.init(nibName: nil, bundle: nil)
    let customHeadersController = CustomViewController.init(nibName: nil, bundle: nil)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let navDefault = UINavigationController(rootViewController: defaultHeadersController)
        let navCustom = UINavigationController(rootViewController: customHeadersController)

        tabBar.viewControllers = [navDefault, navCustom]

        self.window.rootViewController = tabBar

        self.window.makeKeyAndVisible()

        return true
    }
}

