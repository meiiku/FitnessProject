//
//  DateAndRepeatView.swift
//  FitnessProject
//
//  Created by Fedor on 13.04.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    // MARK: - UI Elements
    
    // date and repeat foreground
    private lazy var dateAndRepeatBackground: CustomForegroundView = {
        let view = CustomForegroundView()
        return view
    }()

    // date label
    private lazy var dateLabel: CustomLabel = {
        let label = CustomLabel(text: "Date", type: .smallAnnotation)
        return label
    }()
    
    // date-picker
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = Constants.primaryColor
        return datePicker
    }()
    
    // repeatLabel
    private lazy var repeatLabel: CustomLabel = {
        let label = CustomLabel(text: "Repeat every 7 days", type: .smallAnnotation)
        return label
    }()
    
    // switch
    private lazy var repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = Constants.primaryColor
        return repeatSwitch
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
    private func getData() -> (Date, Bool) {
        return (datePicker.date, repeatSwitch.isOn)
    }
    
    // function for sending data to controller
    public func sendData() -> (Date, Bool) {
        getData()
    }
    
    // sets datePicker and switch to default state
    private func refreshObjects() {
        datePicker.setDate(Date(), animated: true)
        repeatSwitch.isOn = true
    }
    
    public func refreshDatePickerAndSwitch() {
        refreshObjects()
    }
}

// MARK: - Set Views, Constraints
extension DateAndRepeatView {
    
    func setViews() {
        self.addSubview(dateAndRepeatBackground)
        dateAndRepeatBackground.addSubview(dateLabel)
        dateAndRepeatBackground.addSubview(datePicker)
        dateAndRepeatBackground.addSubview(repeatLabel)
        dateAndRepeatBackground.addSubview(repeatSwitch)
    }
    
    func setConstraints() {
        
        // background
        dateAndRepeatBackground.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        
        // date label
        dateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(17)
        }
        
        // date picker
        datePicker.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(dateLabel).offset(-7)
        }
        
        // repeat label
        repeatLabel.snp.makeConstraints { make in
            make.left.equalTo(dateLabel)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        // switch
        repeatSwitch.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(repeatLabel)
        }
    }
}
