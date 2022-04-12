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

        setupViews()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = Constants.tabBarColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = Constants.commentLabelColor.cgColor
    }
    
    private func setupViews() {
        
        // home tab
        let homeScreen = HomeScreenController()
        
        // statistics tab
        let staticticsScreen = StatisticsViewController()
        
        // adding views to tabBar
        setViewControllers([homeScreen, staticticsScreen], animated: true)
        
        // tab bar settings
        guard let items = tabBar.items else { return }
        items[0].title = "Main"
        items[0].image = UIImage(named: "mainTabBar")
        
        items[1].title = "Statistics"
        items[1].image = UIImage(named: "statisticsTabBar")
    }
}

#if DEBUG
import SwiftUI
 
struct MainTabBarController_Preview: PreviewProvider {
    static var previews: some View {
        MainTabBarController().showPreview()
    }
}
#endif

