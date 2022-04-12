//
//  CustomTextField.swift
//  FitnessProject
//
//  Created by Fedor on 13.04.2022.
//

import UIKit

class CustomTextField: UITextField {
    
    // MARK: - init
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = Constants.foregroundColor
        self.layer.cornerRadius = 10
        self.textColor = Constants.secondaryLabelColor
        self.font = .robotoBold20()
        
        // сдвигаем начало вводимого текста на 15 поинтов вправо
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftViewMode = .always
        
        // кнопка очистки
        self.clearButtonMode = .always
        
        // кнопка, которая главная на клавиатуре на месте энтера
        self.returnKeyType = .done
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
