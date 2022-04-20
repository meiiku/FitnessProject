//
//  StarkWorkoutWithImageController.swift
//  FitnessProject
//
//  Created by Fedor on 17.04.2022.
//

import UIKit

class StartWorkoutWithImageController: UIViewController {
    
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
        
    private lazy var exerciseImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "exerciseImage_commonImage")
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
    
    lazy var currentExerciseView = CurrentExerciseSettingsView()
    
    // MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setConstraints()
        setMethods()
    }
    
    // MARK: - Methods
    
    private func setMethods() {
        
    }
}

// MARK: - setup, constraints

extension StartWorkoutWithImageController {
    
    private func setViews() {
        
        // 1-st section
        self.view.backgroundColor = Constants.backgroundColor
        self.view.addSubview(screenTitleLabel)
        self.view.addSubview(closeButton)
        self.view.addSubview(exerciseImage)
        self.view.addSubview(detailsLabel)
        self.view.addSubview(currentExerciseView)
        self.view.addSubview(saveButton)
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
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
        }
        
        // image
        exerciseImage.snp.makeConstraints { make in
            make.top.equalTo(screenTitleLabel.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
            make.width.equalTo(189)
            make.height.equalTo(250)
        }
        
        // details label
        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(exerciseImage.snp.bottom).offset(26)
            make.left.equalToSuperview().offset(32)
        }
        
        // view of exercise settings
        currentExerciseView.snp.makeConstraints { make in
            make.top.equalTo(detailsLabel.snp.bottom)
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
            make.height.equalTo(280)
        }
        
        // save button
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-150)
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
            make.height.equalTo(55)
        }
    }
}
