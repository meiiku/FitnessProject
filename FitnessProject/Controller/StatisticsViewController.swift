//
//  StatisticsViewController.swift
//  FitnessProject
//
//  Created by Fedor on 10.04.2022.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    let statisticsView = StatisticsView()
    
    override func loadView() {
        self.view = statisticsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMethods()
    }
    
    private func setMethods() {
        statisticsView.segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    // method for changing segmentedControl tab
    @objc func segmentChanged() {
        if statisticsView.segmentedControl.selectedSegmentIndex == 0 {
            print("Неделя")
        } else {
            print("Месяц")
        }
    }
}
