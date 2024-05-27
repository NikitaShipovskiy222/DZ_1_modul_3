//
//  UILabelMakePurpuleLabel.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

extension UIButton {
    
    static func purpuleButton(text: String, x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, action: UIAction) -> UIButton {
        {
            
            $0.setTitle(text, for: .normal)
            $0.setTitleColor(.purple, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Sen-Bold", size: 16)
            $0.backgroundColor = .clear
            return $0
        }(UIButton(frame: CGRect(x: x, y: y, width: w, height: h), primaryAction: action))
    }
}
