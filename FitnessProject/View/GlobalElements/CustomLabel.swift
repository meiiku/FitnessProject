//
//  CustomLabel.swift
//  FitnessProject
//
//  Created by Fedor on 10.04.2022.
//

import UIKit

class CustomLabel: UILabel {
    
    enum LabelType {
        case screenTitle
        case comment
        case largeAnnotation
        case smallAnnotation
        
        fileprivate func getLabelTextColor() -> UIColor {
            switch self {
            case .screenTitle: return Constants.primaryLabelColor
            case .comment: return Constants.commentLabelColor
            case .largeAnnotation: return Constants.primaryLabelColor
            case .smallAnnotation: return Constants.primaryLabelColor
            }
        }
        
        fileprivate func getLabelFont() -> UIFont? {
            switch self {
            case .screenTitle: return .robotoMedium24()
            case .comment: return .robotoMedium14()
            case .largeAnnotation: return .robotoMedium24()
            case .smallAnnotation: return .robotoMedium18()
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
