//
//  StatisticsTableViewCell.swift
//  FitnessProject
//
//  Created by Fedor on 11.04.2022.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    // name of the exercise
    private lazy var exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = Constants.primaryLabelColor
        label.font = .robotoMedium24()
        return label
    }()
    
    // repetitions of the exercise
    private lazy var beforeLabel: UILabel = {
        let label = UILabel()
        label.text = "Before: 20"
        label.textColor = Constants.commentLabelColor
        label.font = .robotoMedium16()
        return label
    }()
    
    // sets of the exercise
    private lazy var nowLabel: UILabel = {
        let label = UILabel()
        label.text = "Now: 4"
        label.textColor = Constants.commentLabelColor
        label.font = .robotoMedium16()
        return label
    }()
    
    // stack of elements
    private lazy var labelsStackView = UIStackView(arrangedSubviews: [beforeLabel,nowLabel],
                                                   axis: .horizontal,
                                                   spacing: 20)
    
    // exercise counter
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "+2"
        label.textColor = Constants.primaryColor
        label.font = .robotoMedium24()
        return label
    }()
    
    // sepatator
    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.lightGray
        return view
    }()
    
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    @objc func startButtonTapped() {
        print("startButton tapped")
    }
}
    
// MARK: - Setup, constraints

extension StatisticsTableViewCell {
    
    private func setViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(exerciseNameLabel)
        self.addSubview(labelsStackView)
        self.addSubview(separator)
        self.addSubview(counterLabel)
    }
    
    private func setConstraints() {
        
        // exercise's name
        exerciseNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
        }
        
        // reps and sets
        labelsStackView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview().offset(15)
        }
        
        // exercise separator
        counterLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        // separator
        separator.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
}

