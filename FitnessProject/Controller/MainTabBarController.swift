//
//  MainTabBarController.swift
//  FitnessProject
//
//  Created by Fedor on 11.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeScreen = HomeScreenController()
        let homeScreenBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
        homeScreen.tabBarItem = homeScreenBarItem
        
        let statictics = StatisticsViewController()
        let staticticsBarItem = UITabBarItem(title: "Statistics", image: nil, selectedImage: nil)
        statictics.tabBarItem = staticticsBarItem
        
        self.viewControllers = [homeScreen, statictics]
        
    }
}
