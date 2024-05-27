//
//  UIButtonProfile.ext.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

extension UIButton {
    
    static func profileButton(title: String, img: UIImage, x: CGFloat = 0, y: CGFloat = 0, w: CGFloat = 0, h: CGFloat = 44, contentH: UIControl.ContentHorizontalAlignment = .leading, titileSetting: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20), action: UIAction) -> UIButton {
        {
            $0.backgroundColor = .profileButton
            $0.setTitle(title, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Sen-Bold", size: 14)
            $0.titleLabel?.textColor = .white
            $0.layer.cornerRadius = 5
            $0.contentHorizontalAlignment = contentH
            $0.setImage(img, for: .normal)
            $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
            $0.titleEdgeInsets = titileSetting
           // $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
            return $0
        }(UIButton(frame: CGRect(x: x, y: y, width: w, height: h), primaryAction: action))
    }
}



