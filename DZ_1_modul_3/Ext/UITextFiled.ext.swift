//
//  UITextFiled.ext.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

extension UITextField {

    static func makeTextFiled(placeholder: String, rightView: UIView, passcode: Bool = false) -> UITextField {
        
        {
            $0.placeholder = placeholder
            $0.font = UIFont(name: "Sen-Regular", size: 16)
            $0.layer.cornerRadius = 12
            $0.rightView = rightView
            $0.rightViewMode = .always
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 21, height: 1))
            $0.leftViewMode = .always
            $0.textColor = .lightGray
            $0.backgroundColor = .white
            $0.isSecureTextEntry = passcode
            return $0
        }(UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 71)))
    }
}
