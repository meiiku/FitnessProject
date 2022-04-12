//
//  ViewController.swift
//  FitnessProject
//
//  Created by Fedor on 05.04.2022.
//

import UIKit

class HomeScreenController: UIViewController {
    
    let homeScreen = HomeScreenView()
    
    override func loadView() {
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMethods()
    }
    
    private func setMethods() {
        homeScreen.addWorkoutButton.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
    }
    
    // method for tapping add-workout button
    @objc func addWorkoutButtonTapped() {
        let newWorkoutViewController = NewWorkoutController()
        newWorkoutViewController.modalPresentationStyle = .fullScreen
        present(newWorkoutViewController, animated: true)
        
    }
}
