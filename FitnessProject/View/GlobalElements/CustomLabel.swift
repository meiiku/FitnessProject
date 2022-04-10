//
//  CustomLabel.swift
//  FitnessProject
//
//  Created by Fedor on 10.04.2022.
//

import UIKit

class CustomLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = Constants.commentLabelColor
        self.font = .robotoMedium14()
        self.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
