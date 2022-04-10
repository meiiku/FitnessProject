//
//  CalendarCollectionViewCell.swift
//  FitnessProject
//
//  Created by Fedor on 09.04.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private lazy var dayOfWeek: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.textAlignment = .center
        label.textColor = Constants.whiteColor
        label.font = .robotoBold16()
        return label
    }()
    
    private lazy var numberOfDay: UILabel = {
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
                dayOfWeek.textColor = Constants.primaryLabelColor
                numberOfDay.textColor = Constants.primaryLabelColor
            } else {
                self.backgroundColor = .none
                dayOfWeek.textColor = Constants.whiteColor
                numberOfDay.textColor = Constants.whiteColor
            }
        }
    }
    
    // MARK: - Setup, constraints
    
    private func setViews() {
        self.layer.cornerRadius = 10
        self.addSubview(dayOfWeek)
        self.addSubview(numberOfDay)
    }
    
    private func setConstraints() {
        
        dayOfWeek.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        numberOfDay.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-4)
        }
    }
}
