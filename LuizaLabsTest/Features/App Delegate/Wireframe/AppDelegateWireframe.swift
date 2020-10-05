//
//  AppDelegateWireframe.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class AppDelegateWireframe: AbstractWireframe {

    var window: UIWindow? {
        get {
            return AppDelegate.shared.window
        }
        set {
            AppDelegate.shared.window = newValue
        }
    }
    
    lazy var rootViewController = {
        return self.window?.rootViewController
    }()

    var lastViewController: UIViewController? {
        guard let tabController = window?.rootViewController as? UITabBarController,
            let viewController = tabController.selectedViewController,
            let lastViewController = viewController.children.last else {
                return nil
        }

        return lastViewController
    }

    static func start() -> AppDelegateWireframe {
        
        var wireframe: AppDelegateWireframe!

        let tweetsRootViewController = TweetsWireframe.makeModule(moduleIO: nil)

        wireframe = AppDelegateWireframe(viewController: tweetsRootViewController)

        wireframe.window = UIWindow(frame: UIScreen.main.bounds)
        
        wireframe.window?.rootViewController = tweetsRootViewController
        wireframe.window?.makeKeyAndVisible()
        
        return wireframe
    }
    
}
