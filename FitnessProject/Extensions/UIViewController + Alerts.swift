//
//  UIViewController + Alerts.swift
//  FitnessProject
//
//  Created by Fedor on 23.04.2022.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(actionOK)
        present(alertController, animated: true)
    }
}
