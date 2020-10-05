//
//  AppDelegate.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 01/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var wireframe: AppDelegateWireframe?
    var window: UIWindow?
    
    static var shared : AppDelegate = {
       return UIApplication.shared.delegate as! AppDelegate
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        wireframe = AppDelegateWireframe.start()
        
        return true
    }

}

