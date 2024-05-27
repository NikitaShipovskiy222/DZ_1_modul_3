//
//  UIStackView.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

extension UIStackView {
    
    static func makeStack(addName: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)), addEmail: UIView, addPasscode: UIView, x: CGFloat = 25, y: CGFloat, width: CGFloat = 377, h: CGFloat, spacing: CGFloat = 15) -> UIStackView {
        {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = spacing
            $0.addArrangedSubview(addName)
            $0.addArrangedSubview(addEmail)
            $0.addArrangedSubview(addPasscode)
            return $0
        }(UIStackView(frame: CGRect(x: x, y: y, width: width, height: h)))
    }
}
