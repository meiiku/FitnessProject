//
//  ViewController.swift
//  FitnessProject
//
//  Created by Fedor on 05.04.2022.
//

import UIKit
import SnapKit

class HomeScreenController: UIViewController {
    
    // MARK: - UI Elements
    
    private lazy var avatar: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = Constants.lightGray
        image.layer.borderColor = Constants.whiteColor.cgColor
        image.layer.borderWidth = 5
        return image
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "User name"
        label.font = .robotoMedium24()
        label.textColor = Constants.primaryLabelColor
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var addWorkoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.secondaryColor
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.titleLabel?.font = .robotoMedium12()
        button.titleLabel?.textColor = .black
        // image
        button.setImage(UIImage(named: "addWorkoutButton"), for: .normal)
        button.tintColor = Constants.secondaryColor
        button.imageEdgeInsets = UIEdgeInsets(top: -5, left: 20, bottom: 10, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 50, left: -40, bottom: 0, right: 0)
        
        // shadow
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        return button
    }()
    
    private lazy var workoutTodayLabel: CustomLabel = {
        let label = CustomLabel(text: "Workout today", type: .comment)
        return label
    }()
    
    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    private let exercisesTable = ExercisesTableView()
    
    
    // MARK: - init
    
    override func viewWillLayoutSubviews() {
        avatar.layer.cornerRadius = avatar.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMethods()
        setViews()
        setConstraints()
    }
    
    // MARK: - Methods
    
    private func setMethods() {
        addWorkoutButton.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
    }
    
    // method for tapping add-workout button
    @objc func addWorkoutButtonTapped() {
        let newWorkoutViewController = NewWorkoutController()
        newWorkoutViewController.modalPresentationStyle = .fullScreen
        present(newWorkoutViewController, animated: true)
    }
}

// MARK: - setup, constraints

extension HomeScreenController {
    
    private func setViews() {
        self.view.backgroundColor = Constants.backgroundColor
        self.view.addSubview(calendarView)
        self.view.addSubview(avatar)
        self.view.addSubview(userNameLabel)
        self.view.addSubview(addWorkoutButton)
        self.view.addSubview(weatherView)
        self.view.addSubview(workoutTodayLabel)
        self.view.addSubview(exercisesTable)
    }
    
    private func setConstraints() {
        
        // calendar
        calendarView.snp.makeConstraints { make in
            make.width.equalTo(self.view.layoutMarginsGuide.snp.width)
            make.height.equalTo(69)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        // avatar
        avatar.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.centerY.equalTo(calendarView.snp.top)
        }
        
        // user name
        userNameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatar.snp.right).offset(6)
            make.bottom.equalTo(calendarView.snp.top).offset(-6)
        }
        
        // addWorkout button
        addWorkoutButton.snp.makeConstraints { make in
            make.size.equalTo(80)
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.top.equalTo(calendarView.snp.bottom).offset(6)
        }
        
        // weather view
        weatherView.snp.makeConstraints { make in
            make.height.equalTo(addWorkoutButton)
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
            make.left.equalTo(addWorkoutButton.snp.right).offset(10)
            make.top.equalTo(addWorkoutButton)
        }
        
        // workoutTodayLabel
        workoutTodayLabel.snp.makeConstraints { make in
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.top.equalTo(addWorkoutButton.snp.bottom).offset(15)
        }
        
        // table of exercises
        exercisesTable.snp.makeConstraints { make in
            make.top.equalTo(workoutTodayLabel.snp.bottom).offset(5)
            make.left.equalTo(self.view.layoutMarginsGuide.snp.left)
            make.right.equalTo(self.view.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(self.view.layoutMarginsGuide.snp.bottom)
        }
    }
}
