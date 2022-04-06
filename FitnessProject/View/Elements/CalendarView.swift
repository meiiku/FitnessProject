//
//  CalendarView.swift
//  FitnessProject
//
//  Created by Fedor on 06.04.2022.
//

import UIKit

class CalendarView: UIView {
    
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

extension CalendarView {
    
    private func setupViews() {
        self.backgroundColor = Constants.primaryColor
        self.layer.cornerRadius = 10
    }
    
    private func setupConstraints() {
        
    }
}
