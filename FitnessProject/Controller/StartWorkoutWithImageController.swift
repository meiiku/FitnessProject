//
//  StarkWorkoutWithImageController.swift
//  FitnessProject
//
//  Created by Fedor on 17.04.2022.
//

import UIKit

class StartWorkoutWithImageController: UIViewController {
    
    let startWorkoutWithImageView = StartNewWorkoutWithImageView()
    
    override func loadView() {
        self.view = startWorkoutWithImageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
