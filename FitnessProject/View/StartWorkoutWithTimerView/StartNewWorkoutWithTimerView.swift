//
//  StartNewWorkoutWithTimerView.swift
//  FitnessProject
//
//  Created by Fedor on 17.04.2022.
//

import UIKit
import SnapKit

class StartNewWorkoutWithTimerView: UIView {
    
    // MARK: - UI Elements
    
    // screen title
    private lazy var screenTitleLabel: CustomLabel = {
        let label = CustomLabel(text: "START WORKOUT", type: .screenTitle)
        return label
    }()
    
    // close button
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        return button
    }()
        
    // timer counter
    private lazy var timerCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1:30"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    private lazy var timerOuterImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "timer_outerLine")
        return image
    }()
    
    private lazy var timerInnerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "timer_innerLine")
        return image
    }()
    
    // details label
    private lazy var detailsLabel: CustomLabel = {
        let label = CustomLabel(text: "Details", type: .comment)
        return label
    }()
    
    // save button
    lazy var saveButton: CustomButton = {
        let button = CustomButton(text: "FINISH", color: .green)
        return button
    }()
    
    lazy var currentExerciseWithTimerView = CurrentExerciseSettingsWithTimerView()
    
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

extension StartNewWorkoutWithTimerView {
    
    private func setViews() {
        
        // 1-st section
        self.backgroundColor = Constants.backgroundColor
        self.addSubview(screenTitleLabel)
        self.addSubview(closeButton)
        self.addSubview(timerCountLabel)
        self.addSubview(timerOuterImage)
        self.addSubview(timerInnerImage)
        self.addSubview(detailsLabel)
        self.addSubview(currentExerciseWithTimerView)
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
        
        // timer outer
        timerOuterImage.snp.makeConstraints { make in
            make.top.equalTo(screenTitleLabel.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
        }
        
        // timer inner
        timerInnerImage.snp.makeConstraints { make in
            make.top.equalTo(timerOuterImage).offset(122)
            make.left.equalTo(timerOuterImage)
        }
        
        // timer counter
        timerCountLabel.snp.makeConstraints { make in
            make.center.equalTo(timerOuterImage)
        }
        
        // details label
        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(timerOuterImage.snp.bottom).offset(26)
            make.left.equalToSuperview().offset(32)
        }
        
        // view of exercise settings
        currentExerciseWithTimerView.snp.makeConstraints { make in
            make.top.equalTo(detailsLabel.snp.bottom)
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.layoutMarginsGuide.snp.right)
            make.height.equalTo(280)
        }
        
        // save button
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-150)
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.layoutMarginsGuide.snp.right)
            make.height.equalTo(55)
        }
    }
}


