//  TabVC.swift
//  EnActSystemTask
//  Created by Ranjeet Raushan on 18/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

 var tabBarController: UITabBarController?
 var timeTZone: TimeZone?
class TabVC: NSObject
{
    func sharedClass() -> UITabBarController{
        if tabBarController == nil {
            tabBarController = UITabBarController()
            return tabBarController!
        }
        return tabBarController!
    }
   
    // Home Page
    func launchHomePage(index: NSInteger) -> UITabBarController {
        let tabBar = sharedClass()
        tabBar.delegate = self as? UITabBarControllerDelegate
        let story = UIStoryboard(name: "Main", bundle:nil)
        let tabOneBarItem0 = UITabBarItem(title: "Explore", image:UIImage(named: "explore")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "explore_selected")?.withRenderingMode(.alwaysOriginal))
        let navtab = story.instantiateViewController(withIdentifier: "homeNav") as! HomeNavigationController
        let home = navtab.topViewController  as! ViewController
        home.tabBarItem = tabOneBarItem0
     
        
        // Saved Page
        let saved = story.instantiateViewController(withIdentifier: "SavedVC") as!  SavedVC
        let tabOneBarItem2 = UITabBarItem(title: "Saved", image:UIImage(named: "saved")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "saved_selected")?.withRenderingMode(.alwaysOriginal))
        saved.tabBarItem = tabOneBarItem2
        let navtab2 = UINavigationController.init(rootViewController: saved)
        
        
        // Alerts Page
        
        let alerts = story.instantiateViewController(withIdentifier: "AlertsVC") as!  AlertsVC
        let tabOneBarItem3 = UITabBarItem(title: "Alerts", image:UIImage(named: "alert")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "alert_selected")?.withRenderingMode(.alwaysOriginal))
        alerts.tabBarItem = tabOneBarItem3
        let navtab3 = UINavigationController.init(rootViewController: alerts)
        
        // Profile Page
        let profile = story.instantiateViewController(withIdentifier: "ProfileVC") as!  ProfileVC
        let tabOneBarItem4 = UITabBarItem(title: "Profile", image:UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "profile_selected")?.withRenderingMode(.alwaysOriginal))
        profile.tabBarItem = tabOneBarItem4
        let navtab4 = UINavigationController.init(rootViewController: profile)
        

        tabBar.viewControllers = [navtab, navtab2,navtab3,navtab4]
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .selected)
        UITabBar.appearance().tintColor = UIColor.red
        UITabBar.appearance().barTintColor = UIColor.white
        tabBar.selectedIndex = index
        return tabBar
    }
}

