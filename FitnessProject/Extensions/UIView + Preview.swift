//
//  UIView + Preview.swift
//  FitnessProject
//
//  Created by Fedor on 12.04.2022.
//

import SwiftUI

extension UIView {
    private struct Preview: UIViewRepresentable {

        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
    }
    
    func showPreview() -> some View {
        Preview(view: self)
    }
}
