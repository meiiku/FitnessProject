//
//  StatisticsViewController.swift
//  FitnessProject
//
//  Created by Fedor on 10.04.2022.
//

import UIKit
import SnapKit

class StatisticsViewController: UIViewController {
    
    // MARK: - UI Elements
    
    // screen title
    private lazy var screenTitleLabel: CustomLabel = {
        let label = CustomLabel(text: "STATISTICS", type: .screenTitle)
        return label
    }()
    
    // segmented control
    private let items = ["Неделя", "Месяц"]
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 9
        
        // colors
        segmentedControl.backgroundColor = Constants.primaryColor
        segmentedControl.selectedSegmentTintColor = Constants.secondaryColor
        segmentedControl.setTitleTextAttributes([.foregroundColor : Constants.primaryLabelColor], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor : Constants.whiteColor], for: .normal)
        return segmentedControl
    }()
    
    private lazy var exersicesLabel: CustomLabel = {
        let label = CustomLabel(text: "Exercises", type: .comment)
        return label
    }()
    
    // table
    private let statisticsTable = StatisticsTableView()
    
    // MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setConstraints()
        setMethods()
    }
    
    private func setMethods() {
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    // method for changing segmentedControl tab
    @objc func segmentChanged() {
        if segmentedControl.selectedSegmentIndex == 0 {
            print("Неделя")
        } else {
            print("Месяц")
        }
    }
}

// MARK: - setup, constraints

extension StatisticsViewController {
    
    private func setViews() {
        self.view.backgroundColor = Constants.backgroundColor
        self.view.addSubview(screenTitleLabel)
        self.view.addSubview(segmentedControl)
        self.view.addSubview(exersicesLabel)
        self.view.addSubview(statisticsTable)
    }
    
    private func setConstraints() {
        
        // screen title
        screenTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(75)
        }
        
        // segmented control
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(screenTitleLabel.snp.bottom).offset(31)
            make.width.equalTo(self.view.layoutMarginsGuide.snp.width)
        }
        
        // exersices control
        exersicesLabel.snp.makeConstraints { make in
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
        }
        
        // table
        statisticsTable.snp.makeConstraints { make in
            make.top.equalTo(exersicesLabel.snp.bottom).offset(-5)
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(self.view.layoutMarginsGuide.snp.bottom)
        }
        
    }
}
