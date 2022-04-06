//
//  MainScreenView.swift
//  FitnessProject
//
//  Created by Fedor on 05.04.2022.
//

import UIKit
import SnapKit

class MainScreenView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var avatar: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = Constants.grayColor
        image.layer.borderColor = Constants.whiteColor.cgColor
        image.layer.borderWidth = 5
        return image
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "User name"
        label.font = UIFont.systemFont(ofSize: 24)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.secondaryColor
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setImage(UIImage(named: "addWorkout"), for: .normal)
        button.tintColor = Constants.secondaryColor
        button.imageEdgeInsets = UIEdgeInsets(top: -5, left: 20, bottom: 10, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 50, left: -40, bottom: 0, right: 0)
        
        // shadow
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //    private lazy var weatherStatusBackground: UIView = {
    //        let view = UIView()
    //        view.backgroundColor = Constants.whiteColor
    //        view.layer.cornerRadius = 10
    //        view.layer.shadowColor = UIColor.black.cgColor
    //        view.layer.shadowOpacity = 0.15
    //        view.layer.shadowRadius = 4
    //        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    //        return view
    //    }()
    //
    //    private lazy var weatherStatusLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "Солнечно"
    //        label.font = UIFont.systemFont(ofSize: 18)
    //        label.adjustsFontSizeToFitWidth = true
    ////        label.backgroundColor = .blue
    //        return label
    //    }()
    //
    //    private lazy var weatherAdvice: UILabel = {
    //        let label = UILabel()
    //        label.text = "Хорошая погода, чтобы позаниматься на улице"
    //        label.font = UIFont.systemFont(ofSize: 13)
    //        label.textColor = Constants.grayColor
    //        label.numberOfLines = 2
    //        label.lineBreakMode = .byWordWrapping
    ////        label.backgroundColor = .red
    //        return label
    //    }()
    //
    //    private lazy var weatherIcon: UIImageView = {
    //        let image = UIImageView()
    //        image.image = UIImage(named: "WeatherIcon_Sun")
    //        return image
    //    }()
    
    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    
    // MARK: - init
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = avatar.frame.width / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    @objc private func addWorkoutButtonTapped() {
        print("Add Workout button tapped")
    }
}

// MARK: - Constraints

extension MainScreenView {
    
    private func setupViews() {
        self.backgroundColor = Constants.backgroundColor
        self.addSubview(calendarView)
        self.addSubview(avatar)
        self.addSubview(userNameLabel)
        self.addSubview(addWorkoutButton)
        self.addSubview(weatherView)
    }
    
    private func setupConstraints() {
        
        // calendar
        calendarView.snp.makeConstraints { make in
            make.width.equalTo(self.layoutMarginsGuide.snp.width)
            make.height.equalTo(69)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        // avatar
        avatar.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
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
            make.left.equalTo(self.layoutMarginsGuide.snp.left)
            make.top.equalTo(calendarView.snp.bottom).offset(6)
        }
        
        // weather view
        weatherView.snp.makeConstraints { make in
            make.height.equalTo(addWorkoutButton)
            make.right.equalTo(self.layoutMarginsGuide.snp.right)
            make.left.equalTo(addWorkoutButton.snp.right).offset(10)
            make.top.equalTo(addWorkoutButton)
        }
    }
}
