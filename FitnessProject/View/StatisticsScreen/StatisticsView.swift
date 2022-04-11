//
//  StatisticsView.swift
//  FitnessProject
//
//  Created by Fedor on 10.04.2022.
//

import UIKit
import SnapKit

class StatisticsView: UIView {
    
    // MARK: - UI Elements
    
    // screen title
    private lazy var titleLabel: CustomLabel = {
        let label = CustomLabel(text: "STATISTICS", type: .title)
        label.text = "STATISTICS"
        return label
    }()

    // segmented control
    let items = ["Неделя", "Месяц"]
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 9
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setup, constraints

extension StatisticsView {
    
    private func setViews() {
        self.backgroundColor = Constants.backgroundColor
        self.addSubview(titleLabel)
        self.addSubview(segmentedControl)
        self.addSubview(exersicesLabel)
        self.addSubview(statisticsTable)
    }
    
    private func setConstraints() {
        
        // screen title
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(75)
        }
        
        // segmented control
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(31)
            make.width.equalTo(self.layoutMarginsGuide.snp.width)
        }
        
        // exersices control
        exersicesLabel.snp.makeConstraints { make in
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
        }
        
        // table
        statisticsTable.snp.makeConstraints { make in
            make.top.equalTo(exersicesLabel.snp.bottom).offset(5)
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(self.layoutMarginsGuide.snp.bottom)
        }

    }
}
