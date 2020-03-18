//
//  TabBarController.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.delegate = self
    }
    
    func setupViewControllers(){
        let marketplace = CollectionMarketViewController()
//        CollectionMarketViewController.title = "Marketplace"
        let navMark = UINavigationController(rootViewController: marketplace)
        marketplace.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let profile = ProfileContentView()
        let profileVC = UIHostingController(rootView: profile)
        let navProf = UINavigationController(rootViewController: profileVC)
        marketplace.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        let chat = ChatViewController()
        let navChat = UINavigationController(rootViewController: chat)
        marketplace.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)

        
//        viewControllers = [navMark, navProf]
        viewControllers = [navMark, navProf, navChat]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")
    }

}
