//
//  NewWorkoutController.swift
//  FitnessProject
//
//  Created by Fedor on 12.04.2022.
//

import UIKit

class NewWorkoutController: UIViewController {
    
    let newWorkoutView = NewWorkoutView()
    
    override func loadView() {
        self.view = newWorkoutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMethods()
    }
    
    private func setMethods() {
        newWorkoutView.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    // method for close button
    @objc func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    // method for slider of sets
    @objc func sliderOfSetsValueChanged(_ sender: UISlider) {
        
        // making the slider to stop at round point (like 1.0, 2.0 etc)
        sender.setValue(Float(lroundf(sender.value)), animated: true)
        print(sender.value)
    }
}

