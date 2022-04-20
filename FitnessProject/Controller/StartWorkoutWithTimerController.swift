//
//  StartWorkoutWithTimerController.swift
//  FitnessProject
//
//  Created by Fedor on 17.04.2022.
//

import UIKit

class StartWorkoutWithTimerController: UIViewController {
    
    let startWorkoutWithTimerView = StartNewWorkoutWithTimerView()
    
    override func loadView() {
        self.view = startWorkoutWithTimerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
