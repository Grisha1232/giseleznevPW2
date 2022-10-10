//
//  UIButtonExtension.swift
//  giseleznevPW2
//
//  Created by Григорий Селезнев on 10/10/22.
//

import UIKit

extension UIButton {
    func applyShadows() {
        layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0
        layer.masksToBounds = false
    }
    
    func applyHapticResponse() {
        let impactMedium = UIImpactFeedbackGenerator(style: .medium)
        impactMedium.impactOccurred()
    }
}
