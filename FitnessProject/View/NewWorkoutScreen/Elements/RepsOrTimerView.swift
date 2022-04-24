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
    lazy var setsCounterLabel: CustomLabel = {
        let label = CustomLabel(text: "2", type: .largeAnnotation)
        return label
    }()
    
    // sets slider
    lazy var setsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 2
        slider.minimumTrackTintColor = Constants.primaryColor
        return slider
    }()
    
    // choose repeat/timer label
    private lazy var repeatOrTimerLAbel: CustomLabel = {
        let label = CustomLabel(text: "Choose repear of timer", type: .comment)
        return label
    }()
    
    // Reps label
    lazy var repsLabel: CustomLabel = {
        let label = CustomLabel(text: "Reps", type: .smallAnnotation)
        return label
    }()
    
    // sets counter label
    lazy var repsCounterLabel: CustomLabel = {
        let label = CustomLabel(text: "0", type: .largeAnnotation)
        return label
    }()
    
    // reps slider
    lazy var repsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 0
        slider.minimumTrackTintColor = Constants.primaryColor
        return slider
    }()
    
    // timer label
    lazy var timerLabel: CustomLabel = {
        let label = CustomLabel(text: "Timer", type: .smallAnnotation)
        return label
    }()
    
    // timer counter label
    lazy var timerCounterLabel: CustomLabel = {
        let label = CustomLabel(text: "0 min", type: .largeAnnotation)
        return label
    }()
    
    // time slider
    lazy var timerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 0
        slider.minimumTrackTintColor = Constants.primaryColor
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
    
    // MARK: - Methods
    
    
    // gets data from UI-elements to send it to controller
    private func getData() -> (Int, Int, Int) {
        let setsSliderValue = Int(setsSlider.value)
        let repsSliderValue = Int(repsSlider.value)
        let timerSliderValue = Int(timerSlider.value)
        
        return (setsSliderValue, repsSliderValue, timerSliderValue)
    }
    
    // function for sending data to controller
    public func sendData() -> (Int, Int, Int) {
        getData()
    }
    
    // sets elements to default state
    private func refreshObjects() {
        setsSlider.value = 0
        setsCounterLabel.text = "0"
        repsSlider.value = 0
        repsCounterLabel.text = "0"
        timerSlider.value = 0
        timerCounterLabel.text = "0"
    }
    
    public func refreshslidersAndLabels() {
        refreshObjects()
    }
}

// MARK: - Setup, Constraints

extension RepsOrTimerView {
    
    func setViews() {
        self.addSubview(repsOrTimerBackground)
        repsOrTimerBackground.addSubview(setsLabel)
        repsOrTimerBackground.addSubview(setsCounterLabel)
        repsOrTimerBackground.addSubview(setsSlider)
        repsOrTimerBackground.addSubview(repeatOrTimerLAbel)
        repsOrTimerBackground.addSubview(repsLabel)
        repsOrTimerBackground.addSubview(repsCounterLabel)
        repsOrTimerBackground.addSubview(repsSlider)
        repsOrTimerBackground.addSubview(timerLabel)
        repsOrTimerBackground.addSubview(timerCounterLabel)
        repsOrTimerBackground.addSubview(timerSlider)
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
        setsSlider.snp.makeConstraints { make in
            make.top.equalTo(setsLabel.snp.bottom).offset(5)
            make.left.equalTo(setsLabel)
            make.right.equalTo(setsCounterLabel)
        }
        
        // repeatOrTimerLAbel
        repeatOrTimerLAbel.snp.makeConstraints { make in
            make.top.equalTo(setsSlider.snp.bottom).offset(15)
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
        repsSlider.snp.makeConstraints { make in
            make.top.equalTo(repsLabel.snp.bottom).offset(5)
            make.left.equalTo(repsLabel)
            make.right.equalTo(repsCounterLabel)
        }
        
        // timer label
        timerLabel.snp.makeConstraints { make in
            make.top.equalTo(repsSlider.snp.bottom).offset(30)
            make.left.equalTo(repsLabel)
        }
        
        // timer-counter label
        timerCounterLabel.snp.makeConstraints { make in
            make.right.equalTo(repsCounterLabel)
            make.centerY.equalTo(timerLabel)
        }
        
        // time slider
        timerSlider.snp.makeConstraints { make in
            make.top.equalTo(timerLabel.snp.bottom).offset(5)
            make.left.equalTo(timerLabel)
            make.right.equalTo(timerCounterLabel)
        }
    }
}

