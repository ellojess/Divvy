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
        //Setup color scheme
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor(named: "divvyGreen")
        self.tabBar.tintColor = UIColor(named: "divvyDarkGreen")
        //======================
        let marketplace = CollectionMarketViewController()
//        CollectionMarketViewController.title = "Marketplace"
        let navMark = UINavigationController(rootViewController: marketplace)
        marketplace.tabBarItem = UITabBarItem(title: "Market", image: UIImage(named:"marketplace"), tag: 0)
        
        let profile = ProfileContentView()
        let profileVC = UIHostingController(rootView: profile)
        let navProf = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named:"user"), tag: 1)
        
        let cart = ShoppingCartViewController()
        let navCart = UINavigationController(rootViewController: cart)
        cart.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(named:"buy"), tag: 2)
        
        let chat = ChatViewController()
        let navChat = UINavigationController(rootViewController: chat)
        chat.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named:"chat"), tag: 3)
        
        viewControllers = [navMark, navProf,navCart, navChat]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")
    }

}

/*
 --Profile--
 Icons made by <a href="https://www.flaticon.com/authors/those-icons" title="Those Icons">Those Icons</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
 --Chat--
 Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
 --Cart--
 Icons made by <a href="https://www.flaticon.com/authors/bqlqn" title="bqlqn">bqlqn</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
 --Stuff--
 */
