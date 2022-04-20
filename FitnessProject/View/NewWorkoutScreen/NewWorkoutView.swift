//
//  NewWorkoutView.swift
//  FitnessProject
//
//  Created by Fedor on 12.04.2022.
//

import UIKit
import SnapKit

class NewWorkoutView: UIView {
    
    // MARK: - UI Elements
    
    // screen title
    private lazy var screenTitleLabel: CustomLabel = {
        let label = CustomLabel(text: "NEW WORKOUT", type: .screenTitle)
        return label
    }()
    
    // close button
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        return button
    }()
    
    // name label
    private lazy var nameLabel: CustomLabel = {
        let label = CustomLabel(text: "Name", type: .comment)
        return label
    }()
    
    // name text-field
    lazy var nameTextField: CustomTextField = {
        let textfield = CustomTextField()
        return textfield
    }()
    
    // date and repeat label
    private lazy var dateAndRepeatLabel: CustomLabel = {
        let label = CustomLabel(text: "Date and repeat", type: .comment)
        return label
    }()
    
    // reps or timer label
    private lazy var repsOrTimerLabel: CustomLabel = {
        let label = CustomLabel(text: "Reps or timer", type: .comment)
        return label
    }()
    
    // save button
    lazy var saveButton: CustomButton = {
        let button = CustomButton(text: "SAVE", color: .green)
        return button
    }()
    
    lazy var dateAndRepeatView = DateAndRepeatView()
    lazy var repsOrTimerView = RepsOrTimerView()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstraints()
        setMethods()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setMethods() {
        
    }
}

// MARK: - setup, constraints

extension NewWorkoutView {
    
    private func setViews() {
        
        // 1-st section
        self.backgroundColor = Constants.backgroundColor
        self.addSubview(screenTitleLabel)
        self.addSubview(closeButton)
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        
        // 2-nd section
        self.addSubview(dateAndRepeatLabel)
        self.addSubview(dateAndRepeatView)
        
        // 3-rd section
        self.addSubview(repsOrTimerLabel)
        self.addSubview(repsOrTimerView)
        self.addSubview(saveButton)
    }
    
    private func setConstraints() {
        
        // screen title
        screenTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.centerX.equalToSuperview()
        }
        
        // close button
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(screenTitleLabel)
            make.right.equalTo(self.layoutMarginsGuide.snp.right)
        }
        
        // name label
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(screenTitleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(32)
        }
        
        // name text-field
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.width.equalTo(self.layoutMarginsGuide.snp.width)
            make.centerX.equalToSuperview()
            make.height.equalTo(38)
        }
        
        // date and repeat label
        dateAndRepeatLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(14)
            make.left.equalTo(nameLabel)
        }
        
        // date-and-repeat view
        dateAndRepeatView.snp.makeConstraints { make in
            make.top.equalTo(dateAndRepeatLabel.snp.bottom)
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.layoutMarginsGuide.snp.right)
            make.height.equalTo(93)
        }
        
        // reps or timer label
        repsOrTimerLabel.snp.makeConstraints { make in
            make.top.equalTo(dateAndRepeatView.snp.bottom).offset(20)
            make.left.equalTo(nameLabel)
        }
        
        // reps-or-timer view
        repsOrTimerView.snp.makeConstraints { make in
            make.top.equalTo(repsOrTimerLabel.snp.bottom)
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.layoutMarginsGuide.snp.right)
            make.height.equalTo(275)
        }
        
        // save button
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(repsOrTimerView.snp.bottom).offset(50)
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.layoutMarginsGuide.snp.right)
            make.height.equalTo(55)
        }
    }
}
