//
//  AppDelegate.swift
//  Restaurant
//
//  Created by Alexander on 29/07/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var orderTabBarItem: UITabBarItem!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let tabBarController = window?.rootViewController as? UITabBarController
        orderTabBarItem = tabBarController?.viewControllers?[1].tabBarItem
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateOrderBadge), name: MenuController.orderUpdatedNotification, object: nil)
        
        return true
    }
    
    @objc func updateOrderBadge() {
        let orderCount = MenuController.shared.order.menuItems.count
        orderTabBarItem?.badgeValue = orderCount == 0 ? nil : String(orderCount)
    }
}

