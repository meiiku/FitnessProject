//
//  CustomForegroundView.swift
//  FitnessProject
//
//  Created by Fedor on 13.04.2022.
//

import UIKit


// gray view-blocks for exercises
class CustomForegroundView: UIView {
    
    // MARK: - init
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = Constants.foregroundColor
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

