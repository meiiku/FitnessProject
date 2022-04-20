//
//  NewWorkoutController.swift
//  FitnessProject
//
//  Created by Fedor on 12.04.2022.
//

import UIKit
import RealmSwift

class NewWorkoutController: UIViewController {
    
    // MARK: - elements
    
    private let newWorkoutView = NewWorkoutView()
    
    private lazy var closeButton = newWorkoutView.closeButton
    private lazy var setsSlider = newWorkoutView.repsOrTimerView.setsSlider
    private lazy var repsSlider = newWorkoutView.repsOrTimerView.repsSlider
    private lazy var timerSlider = newWorkoutView.repsOrTimerView.timerSlider
    
    private lazy var repsLabel = newWorkoutView.repsOrTimerView.repsLabel
    private lazy var timerLabel = newWorkoutView.repsOrTimerView.timerLabel
    
    private lazy var setsCounter = newWorkoutView.repsOrTimerView.setsCounterLabel
    private lazy var repsCounter = newWorkoutView.repsOrTimerView.repsCounterLabel
    private lazy var timerCounter = newWorkoutView.repsOrTimerView.timerCounterLabel
    
    private lazy var name = newWorkoutView.nameTextField
    private lazy var saveButton = newWorkoutView.saveButton
    
    // MARK: - init
    
    override func loadView() {
        self.view = newWorkoutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMethods()
    }
    
    // MARK: - Methods
    
    private func setMethods() {
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        setsSlider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        repsSlider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        timerSlider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // method for close button
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func setsSliderChanged(_ sender: UISlider) {
        setsCounter.text = "\(Int(sender.value))"
    }
    
    @objc private func repsSliderChanged(_ sender: UISlider) {
        repsCounter.text = "\(Int(sender.value))"
        
        setSliderActive(label: repsLabel, counterLabel: repsCounter, slider: repsSlider)
        setSliderInactive(label: timerLabel, counterLabel: timerCounter, slider: timerSlider)
    }
    
    @objc private func timerSliderChanged(_ sender: UISlider) {
        
        setSliderActive(label: timerLabel, counterLabel: timerCounter, slider: timerSlider)
        setSliderInactive(label: repsLabel, counterLabel: repsCounter, slider: repsSlider)
        
        // setting value of timer to label in the form like "1 min 30 sec"
        let seconds = (Int(timerSlider.value)) / 60
        let minutes = (Int(timerSlider.value)) % 60
        
        timerCounter.text = {
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
        RealmManager.shared.saveWorkoutModel(model: workoutModel)
        workoutModel = WorkoutModel()
    }
    
    
    // MARK: - Realm
    
    private let localRealm = try! Realm()
    private var workoutModel = WorkoutModel()
    private let testImage = UIImage(named: "exerciseImage_Biceps")
    
    private func setModel() {
        
        // name of exercise
        guard let workoutName = newWorkoutView.nameTextField.text else { return }
        workoutModel.workoutName = workoutName
        
        // info from 1st block of information (date and repeating)
        let dateFromPicker = newWorkoutView.dateAndRepeatView.sendData().0
        workoutModel.workoutDate = dateFromPicker
        workoutModel.workoutNumberOfDay = dateFromPicker.numberOfWeekday()
        workoutModel.workoutIsRepeat = newWorkoutView.dateAndRepeatView.sendData().1
        
        // info from 2nd block of information (sliders)
        workoutModel.workoutSets = newWorkoutView.repsOrTimerView.sendData().0
        workoutModel.workoutReps = newWorkoutView.repsOrTimerView.sendData().1
        workoutModel.workoutTimer = newWorkoutView.repsOrTimerView.sendData().2
        
        // exercise's image
        guard let imageData = testImage?.pngData() else { return }
        workoutModel.workoutImage = imageData
    }
}

