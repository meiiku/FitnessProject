//
//  WeatherView.swift
//  FitnessProject
//
//  Created by Fedor on 06.04.2022.
//

import UIKit

class WeatherView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.font = .robotoMedium18()
        label.textColor = Constants.primaryLabelColor
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.font = .robotoMedium12()
        label.textColor = Constants.lightGray
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherIcon_Sun")
        return image
    }()
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherView {
    
    private func setupViews() {
        self.backgroundColor = Constants.whiteColor
        self.layer.cornerRadius = 10
        
        // shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        self.addSubview(weatherStatusLabel)
        self.addSubview(weatherDescriptionLabel)
        self.addSubview(weatherIcon)
    }
    
    private func setupConstraints() {
        
        // status of weather
        weatherStatusLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-48)
            make.left.equalToSuperview().offset(10)
        }
        
        // weather advice
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherStatusLabel.snp.bottom).offset(-4)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(weatherIcon.snp.left)
        }
        
        // weather icon
        weatherIcon.snp.makeConstraints { make in
            make.size.equalTo(62)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
        }
    }
}

