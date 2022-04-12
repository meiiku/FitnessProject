//
//  UITabBarController + Preview.swift
//  FitnessProject
//
//  Created by Fedor on 12.04.2022.
//

import UIKit
import SwiftUI
 
extension UITabBarController {
   private struct Preview: UIViewControllerRepresentable {
 
       let viewController: UIViewController
      
       func makeUIViewController(context: Context) -> UIViewController {
           return viewController
       }
      
       func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
   }
  
   func showPreview() -> some View {
       Preview(viewController: self)
   }
}
