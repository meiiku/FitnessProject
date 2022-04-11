//
//  CustomLabel.swift
//  FitnessProject
//
//  Created by Fedor on 10.04.2022.
//

import UIKit

class CustomLabel: UILabel {
    
    enum LabelType {
        case title
        case comment
        
        fileprivate func getLabelTextColor() -> UIColor {
            switch self {
            case .title: return Constants.primaryLabelColor
            case .comment: return Constants.commentLabelColor
            }
        }
        
        fileprivate func getLabelFont() -> UIFont? {
            switch self {
            case .title: return .robotoMedium24()
            case .comment: return .robotoMedium14()
            }
        }
    }
    
    // MARK: - init
    init(text: String, type: LabelType) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = LabelType.getLabelTextColor(type)()
        self.font = LabelType.getLabelFont(type)()
        self.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
