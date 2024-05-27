//
//  UILabelMyProfile.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

extension UILabel {
    
    static func makeProfileLabel(text: String, sizeFont: CGFloat, alignment: NSTextAlignment, x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) -> UILabel {
        
        {
            $0.text = text
            $0.textColor = .white
            $0.font = UIFont(name: "Sen-Bold", size: sizeFont)
            $0.textAlignment = alignment
            return $0
        }(UILabel(frame: CGRect(x: x, y: y, width: w, height: h)))
        
    }
    
}
