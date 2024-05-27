//
//  UIButton.ext.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

extension UIButton {
    
    static func makePurpuleButton(title: String, x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, action: UIAction) -> UIButton {
        
        {
            $0.setTitle(title, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Sen-Bold", size: 16)
            $0.backgroundColor = .purple
            $0.layer.cornerRadius = 14
            $0.titleLabel?.textColor = .white
            return $0
        }(UIButton(frame: CGRect(x: x, y: y, width: w, height: h), primaryAction: action))
    }
    
}
