//
//  RepsOrTimerView.swift
//  FitnessProject
//
//  Created by Fedor on 13.04.2022.
//


import UIKit

class RepsOrTimerView: UIView {
    
    // MARK: - UI Elements
    
    // date and repeat foreground
    private lazy var repsOrTimerBackground: CustomForegroundView = {
        let view = CustomForegroundView()
        return view
    }()

    // sets label
    private lazy var setsLabel: CustomLabel = {
        let label = CustomLabel(text: "Sets", type: .smallAnnotation)
        return label
    }()
    
    // sets counter label
    private lazy var setsCounterLabel: CustomLabel = {
        let label = CustomLabel(text: "4", type: .largeAnnotation)
        return label
    }()
    
    // sets slider
    lazy var sliderOfSets: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 4
        slider.minimumTrackTintColor = Constants.primaryColor
        return slider
    }()
    
    // choose repeat/timer label
    private lazy var repeatOrTimerLAbel: CustomLabel = {
        let label = CustomLabel(text: "Choose repear of timer", type: .comment)
        return label
    }()
    
    // Reps label
    private lazy var repsLabel: CustomLabel = {
        let label = CustomLabel(text: "Reps", type: .smallAnnotation)
        return label
    }()
    
    // sets counter label
    private lazy var repsCounterLabel: CustomLabel = {
        let label = CustomLabel(text: "10", type: .largeAnnotation)
        return label
    }()
    
    // reps slider
    lazy var sliderOfReps: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 10
        slider.minimumTrackTintColor = Constants.primaryColor
        return slider
    }()
    
    // timer label
    private lazy var timerLabel: CustomLabel = {
        let label = CustomLabel(text: "Timer", type: .smallAnnotation)
        label.isEnabled = false
        return label
    }()
    
    // timer counter label
    private lazy var timerCounterLabel: CustomLabel = {
        let label = CustomLabel(text: "1 min 30 sec", type: .largeAnnotation)
        label.isEnabled = false
        return label
    }()
    
    // time slider
    lazy var sliderOfTime: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 5
        slider.value = 1.5
        slider.minimumTrackTintColor = Constants.primaryColor
        slider.isEnabled = false
        return slider
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
}

// MARK: - Setup, Constraints

extension RepsOrTimerView {
    
    func setViews() {
        self.addSubview(repsOrTimerBackground)
        repsOrTimerBackground.addSubview(setsLabel)
        repsOrTimerBackground.addSubview(setsCounterLabel)
        repsOrTimerBackground.addSubview(sliderOfSets)
        repsOrTimerBackground.addSubview(repeatOrTimerLAbel)
        repsOrTimerBackground.addSubview(repsLabel)
        repsOrTimerBackground.addSubview(repsCounterLabel)
        repsOrTimerBackground.addSubview(sliderOfReps)
        repsOrTimerBackground.addSubview(timerLabel)
        repsOrTimerBackground.addSubview(timerCounterLabel)
        repsOrTimerBackground.addSubview(sliderOfTime)
    }
    
    func setConstraints() {
        
        // background
        repsOrTimerBackground.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        
        // sets label
        setsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(25)
        }
        
        // sets-counter label
        setsCounterLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-13)
            make.centerY.equalTo(setsLabel)
        }
        
        // sets slider
        sliderOfSets.snp.makeConstraints { make in
            make.top.equalTo(setsLabel.snp.bottom).offset(5)
            make.left.equalTo(setsLabel)
            make.right.equalTo(setsCounterLabel)
        }
        
        // repeatOrTimerLAbel
        repeatOrTimerLAbel.snp.makeConstraints { make in
            make.top.equalTo(sliderOfSets.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        // reps label
        repsLabel.snp.makeConstraints { make in
            make.top.equalTo(repeatOrTimerLAbel.snp.bottom).offset(-5)
            make.left.equalTo(setsLabel)
        }
        
        // reps-counter label
        repsCounterLabel.snp.makeConstraints { make in
            make.right.equalTo(setsCounterLabel)
            make.centerY.equalTo(repsLabel)
        }
        
        // reps slider
        sliderOfReps.snp.makeConstraints { make in
            make.top.equalTo(repsLabel.snp.bottom).offset(5)
            make.left.equalTo(repsLabel)
            make.right.equalTo(repsCounterLabel)
        }
        
        // timer label
        timerLabel.snp.makeConstraints { make in
            make.top.equalTo(sliderOfReps.snp.bottom).offset(30)
            make.left.equalTo(repsLabel)
        }
        
        // timer-counter label
        timerCounterLabel.snp.makeConstraints { make in
            make.right.equalTo(repsCounterLabel)
            make.centerY.equalTo(timerLabel)
        }
        
        // time slider
        sliderOfTime.snp.makeConstraints { make in
            make.top.equalTo(timerLabel.snp.bottom).offset(5)
            make.left.equalTo(timerLabel)
            make.right.equalTo(timerCounterLabel)
        }
    }
}

