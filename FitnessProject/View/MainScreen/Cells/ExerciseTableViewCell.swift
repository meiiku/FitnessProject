//
//  ExerciseTableViewCell.swift
//  FitnessProject
//
//  Created by Fedor on 10.04.2022.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private lazy var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.foregroundColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    // image of the exercise
    private lazy var exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ExerciseImage_Biceps")?.withRenderingMode(.alwaysTemplate)
        return imageView
    }()
    
    // name of the exercise
    private lazy var exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = Constants.primaryLabelColor
        label.font = .robotoMedium22()
        return label
    }()
    
    // repetitions of the exercise
    private lazy var exerciseRepsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps: 20"
        label.textColor = Constants.secondaryLabelColor
        label.font = .robotoMedium16()
        return label
    }()
    
    // sets of the exercise
    private lazy var exerciseSetsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets: 4"
        label.textColor = Constants.secondaryLabelColor
        label.font = .robotoMedium16()
        return label
    }()
    
    // stack of elements
    private lazy var labelsStackView = UIStackView(arrangedSubviews: [exerciseRepsLabel,exerciseSetsLabel],
                                                   axis: .horizontal,
                                                   spacing: 10)
    
    private lazy var startExerciseButton: CustomButton = {
        let button = CustomButton(text: "START", color: .yellow)
        
        // shadow
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        return button
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

extension ExerciseTableViewCell {
    
    private func setViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(backgroundCell)
        self.addSubview(exerciseImageView)
        self.addSubview(exerciseNameLabel)
        self.addSubview(exerciseRepsLabel)
        self.addSubview(labelsStackView)
        contentView.addSubview(startExerciseButton)
        startExerciseButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    private func setConstraints() {
        
        // background
        backgroundCell.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
        
        // image of exercise
        exerciseImageView.snp.makeConstraints { make in
            make.size.equalTo(70)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        // exercise's name
        exerciseNameLabel.snp.makeConstraints { make in
            make.left.equalTo(exerciseImageView.snp.right).offset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        // reps and sets
        labelsStackView.snp.makeConstraints { make in
            make.left.equalTo(exerciseImageView.snp.right).offset(10)
            make.top.equalTo(exerciseNameLabel.snp.bottom)
        }
        
        // start-button
        startExerciseButton.snp.makeConstraints { make in
            make.left.equalTo(labelsStackView)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(labelsStackView.snp.bottom).offset(3)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}


