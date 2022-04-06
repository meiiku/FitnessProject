//
//  Button.swift
//  FitnessProject
//
//  Created by Fedor on 06.04.2022.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    enum Colors {
        case green
        case yellow
        
        fileprivate func getButtonBackgroundColor() -> UIColor {
            switch self {
            case .green: return Constants.primaryColor
            case .yellow: return Constants.secondaryColor
            }
        }
        
        fileprivate func getButtonTextColor() -> UIColor{
            switch self {
            case .green: return Constants.whiteColor
            case .yellow: return UIColor(red: 81, green: 81, blue: 80, alpha: 1)
            }
        }
    }
    
    // MARK: - init
    init(text: String, color: Colors) {
        super.init(frame: .zero)
        
        self.setTitle(text, for: .normal)
        self.setTitleColor(Colors.getButtonTextColor(color)(), for: .normal)
        self.backgroundColor = Colors.getButtonBackgroundColor(color)()
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
