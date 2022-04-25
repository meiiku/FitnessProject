//
//  CalendarCollectionViewCell.swift
//  FitnessProject
//
//  Created by Fedor on 09.04.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private lazy var dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.textAlignment = .center
        label.textColor = Constants.whiteColor
        label.font = .robotoBold16()
        return label
    }()
    
    private lazy var numberOfDayLabel: UILabel = {
        let label = UILabel()
        label.text = "14"
        label.textAlignment = .center
        label.textColor = Constants.whiteColor
        label.font = .robotoBold16()
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    // what is happening when cell is selected
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.backgroundColor = Constants.secondaryColor
                dayOfWeekLabel.textColor = Constants.primaryLabelColor
                numberOfDayLabel.textColor = Constants.primaryLabelColor
            } else {
                self.backgroundColor = .none
                dayOfWeekLabel.textColor = Constants.whiteColor
                numberOfDayLabel.textColor = Constants.whiteColor
            }
        }
    }
    
    // sets the calendar to cells
    private func configureCell(numberOfDay: String, weekday: String) {
        numberOfDayLabel.text = numberOfDay
        dayOfWeekLabel.text = weekday
    }
    
    public func setDateToCells (numberOfDay: String, weekday: String) {
        configureCell(numberOfDay: numberOfDay, weekday: weekday)
    }
    
    // MARK: - Setup, constraints
    
    private func setViews() {
        self.layer.cornerRadius = 10
        self.addSubview(dayOfWeekLabel)
        self.addSubview(numberOfDayLabel)
    }
    
    private func setConstraints() {
        
        dayOfWeekLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        numberOfDayLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-4)
        }
    }
}
