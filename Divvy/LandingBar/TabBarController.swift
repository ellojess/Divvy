//
//  TabBarController.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.delegate = self
    }
    
    func setupViewControllers(){
        let marketplace = CollectionMarketViewController()
//        CollectionMarketViewController.title = "Marketplace"
        let nav1 = UINavigationController(rootViewController: marketplace)
        marketplace.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        viewControllers = [nav1]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")
    }

}
