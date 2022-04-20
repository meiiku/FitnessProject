//
//  CurrentExerciseSettingsView.swift
//  FitnessProject
//
//  Created by Fedor on 17.04.2022.
//

import UIKit

class CurrentExerciseSettingsView: UIView {
    
    // MARK: - UI Elements
    
    // date and repeat foreground
    private lazy var currentExerciseBackground: CustomForegroundView = {
        let view = CustomForegroundView()
        return view
    }()

    // date label
    private lazy var nameOfExerciseLabel: CustomLabel = {
        let label = CustomLabel(text: "Biceps", type: .largeAnnotation)
        return label
    }()

    // sets label
    private lazy var setsLabel: CustomLabel = {
        let label = CustomLabel(text: "Sets", type: .largeAnnotation)
        return label
    }()
    
    // sets count
    private lazy var setsCount: CustomLabel = {
        let label = CustomLabel(text: "1/4", type: .largeAnnotation)
        return label
    }()
    
    // separator
    private lazy var separator1: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.lightGray
        return view
    }()
    
    // reps label
    private lazy var repsLabel: CustomLabel = {
        let label = CustomLabel(text: "Reps", type: .largeAnnotation)
        return label
    }()
    
    // sets count
    private lazy var repsCount: CustomLabel = {
        let label = CustomLabel(text: "20", type: .largeAnnotation)
        return label
    }()
    
    // separator
    private lazy var separator2: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.lightGray
        return view
    }()
    
    // edit button
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = .none
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(Constants.commentLabelColor, for: .normal)
        return button
    }()
    
    // next set button
    private lazy var nextSetButton: UIButton = {
        let button = CustomButton(text: "NEXT SET", color: .yellow)
        return button
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
    
}

// MARK: - Set Views, Constraints
extension CurrentExerciseSettingsView {
    
    func setViews() {
        self.addSubview(currentExerciseBackground)
        currentExerciseBackground.addSubview(nameOfExerciseLabel)
        currentExerciseBackground.addSubview(setsLabel)
        currentExerciseBackground.addSubview(setsCount)
        currentExerciseBackground.addSubview(separator1)
        currentExerciseBackground.addSubview(repsLabel)
        currentExerciseBackground.addSubview(repsCount)
        currentExerciseBackground.addSubview(separator2)
        currentExerciseBackground.addSubview(editButton)
        currentExerciseBackground.addSubview(nextSetButton)
    }
    
    func setConstraints() {
        
        // background
        currentExerciseBackground.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        
        // name Of Exercise
        nameOfExerciseLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(14)
        }
        
        // sets label
        setsLabel.snp.makeConstraints { make in
            make.top.equalTo(nameOfExerciseLabel.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(16)
        }
        
        // sets count
        setsCount.snp.makeConstraints { make in
            make.top.equalTo(setsLabel)
            make.right.equalToSuperview().offset(-16)
        }
        
        // separator_1
        separator1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(1)
            make.top.equalTo(setsLabel.snp.bottom).offset(3)
        }
        
        // reps label
        repsLabel.snp.makeConstraints { make in
            make.top.equalTo(separator1.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
        }
        
        // reps count
        repsCount.snp.makeConstraints { make in
            make.top.equalTo(repsLabel)
            make.right.equalToSuperview().offset(-16)
        }
        
        // separator_2
        separator2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(1)
            make.top.equalTo(repsLabel.snp.bottom).offset(3)
        }
        
        // edit button
        editButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(separator2.snp.bottom).offset(15)
        }
        
        // next set button
        nextSetButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-18)
            make.top.equalTo(editButton.snp.bottom).offset(12)
            make.height.equalTo(43)
        }
        
    }
}
