//
//  NewWorkoutController.swift
//  FitnessProject
//
//  Created by Fedor on 12.04.2022.
//

import UIKit

class NewWorkoutController: UIViewController {
    
    // MARK: - elements
    
    //    private lazy var closeButton = newWorkoutView.closeButton
        private lazy var setsSlider = repsOrTimerView.setsSlider
        private lazy var repsSlider = repsOrTimerView.repsSlider
        private lazy var timerSlider = repsOrTimerView.timerSlider
    //
        private lazy var repsLabel = repsOrTimerView.repsLabel
        private lazy var timerLabel = repsOrTimerView.timerLabel
    
        private lazy var setsCounterLabel = repsOrTimerView.setsCounterLabel
        private lazy var repsCounterLabel = repsOrTimerView.repsCounterLabel
        private lazy var timerCounterLabel = repsOrTimerView.timerCounterLabel
    
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
    private lazy var saveButton: CustomButton = {
        let button = CustomButton(text: "SAVE", color: .green)
        return button
    }()
    
    lazy var dateAndRepeatView = DateAndRepeatView()
    lazy var repsOrTimerView = RepsOrTimerView()
    
    // MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setConstraints()
        setDelegate()
        setMethods()
        addTaps()
    }
    
    // MARK: - Methods
    
    private func setMethods() {
        
        // buttons
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        // sliders
        setsSlider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        repsSlider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        timerSlider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
    }
    
    private func setDelegate() {
        nameTextField.delegate = self
    }
    
    // method for close button
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func setsSliderChanged(_ sender: UISlider) {
        setsCounterLabel.text = "\(Int(sender.value))"
    }
    
    @objc private func repsSliderChanged(_ sender: UISlider) {
        repsCounterLabel.text = "\(Int(sender.value))"
        
        setSliderActive(label: repsLabel, counterLabel: repsCounterLabel, slider: repsSlider)
        setSliderInactive(label: timerLabel, counterLabel: timerCounterLabel, slider: timerSlider)
    }
    
    @objc private func timerSliderChanged(_ sender: UISlider) {
        
        setSliderActive(label: timerLabel, counterLabel: timerCounterLabel, slider: timerSlider)
        setSliderInactive(label: repsLabel, counterLabel: repsCounterLabel, slider: repsSlider)
        
        // setting value of timer to label in the form like "1 min 30 sec"
        let seconds = (Int(timerSlider.value)) / 60
        let minutes = (Int(timerSlider.value)) % 60
        
        timerCounterLabel.text = {
            if seconds != 0 {
                return "\(minutes) min \(seconds) sec"
            } else {
                return "\(minutes) min"
            }
        }()
    }
    
    @objc private func setSliderInactive(label: UILabel, counterLabel: UILabel, slider: UISlider) {
        label.alpha = 0.5
        counterLabel.alpha = 0.5
        counterLabel.text = "0"
        slider.alpha = 0.5
        slider.value = 0
    }
    
    @objc private func setSliderActive(label: UILabel, counterLabel: UILabel, slider: UISlider) {
        label.alpha = 1
        counterLabel.alpha = 1
        slider.alpha = 1
    }
    
    @objc private func saveButtonTapped() {
        print("saveButtonTapped")
        setModel()
        saveModel()
        refreshObjects()
        
//        RealmManager.shared.saveWorkoutModel(model: workoutModel)
//        workoutModel = WorkoutModel()
    }
    
    private func saveModel() {
        guard let text = nameTextField.text else { return }
        
        // counting symbols exluding spaces
        let count = text.filter { $0.isNumber || $0.isLetter }.count
        
        // if workout name contains at least one symbol and sets > 0 and reps/timer > 0 then save model
        if count != 0 &&
            workoutModel.workoutSets != 0 &&
            (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            
            RealmManager.shared.saveWorkoutModel(model: workoutModel)
            workoutModel = WorkoutModel()
            showAlert(title: "Workout has been saved", message: nil)
        } else {
            showAlert(title: "Error", message: "Enter name and reps/timer")
        }
    }
    
    private func refreshObjects() {
        dateAndRepeatView.refreshDatePickerAndSwitch()
        repsOrTimerView.refreshslidersAndLabels()
        nameTextField.text = ""
    }
    
    // hiding keyboard
    private func addTaps() {
        
        // by tapping out of TextField
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapScreen)
        
        // by swiping sliders
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Realm
    
//    private let localRealm = try! Realm()
    private var workoutModel = WorkoutModel()
    private let testImage = UIImage(named: "exerciseImage_Biceps")
    
    private func setModel() {
        
        // name of exercise
        guard let workoutName = nameTextField.text else { return }
        workoutModel.workoutName = workoutName
        
        // info from 1st block of information (date and repeating)
        let dateFromPicker = dateAndRepeatView.sendData().0
        workoutModel.workoutDate = dateFromPicker
        workoutModel.workoutNumberOfDay = dateFromPicker.numberOfWeekday()
        workoutModel.workoutIsRepeat = dateAndRepeatView.sendData().1
        
        // info from 2nd block of information (sliders)
        workoutModel.workoutSets = repsOrTimerView.sendData().0
        workoutModel.workoutReps = repsOrTimerView.sendData().1
        workoutModel.workoutTimer = repsOrTimerView.sendData().2
        
        // exercise's image
        guard let imageData = testImage?.pngData() else { return }
        workoutModel.workoutImage = imageData
    }
}

// MARK: - setup, constraints

extension NewWorkoutController {
    
    private func setViews() {
        
        // 1-st section
        self.view.backgroundColor = Constants.backgroundColor
        self.view.addSubview(screenTitleLabel)
        self.view.addSubview(closeButton)
        self.view.addSubview(nameLabel)
        self.view.addSubview(nameTextField)
        
        // 2-nd section
        self.view.addSubview(dateAndRepeatLabel)
        self.view.addSubview(dateAndRepeatView)
        
        // 3-rd section
        self.view.addSubview(repsOrTimerLabel)
        self.view.addSubview(repsOrTimerView)
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
        
        // name label
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(screenTitleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(32)
        }
        
        // name text-field
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.width.equalTo(self.view.layoutMarginsGuide.snp.width)
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
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
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
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
            make.height.equalTo(275)
        }
        
        // save button
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(repsOrTimerView.snp.bottom).offset(50)
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
            make.height.equalTo(55)
        }
    }
}

// MARK: - UITextFieldDelegate

extension NewWorkoutController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
    }
    
}

