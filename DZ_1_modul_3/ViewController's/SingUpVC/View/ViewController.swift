//
//  ViewController.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

//MARK: - Sing Up ViewController
final class ViewController: UIViewController {

    private lazy var eyeButton = EyeButton()
    private var isPrivate = true
    var singleton = SingltonModel.shared
    
    private lazy var labelRegist = UILabel.makeLabel(text: "Регистрация", x: 99, y: 279, w: view.frame.width - 198, h: 41)
    
    private lazy var labelAgree: UILabel = {
        $0.text = "Я согласен с Условиями предоставления услуг и Политикой конфиденциальности"
        $0.font = UIFont(name: "Sen-Regular", size: 14)
        $0.textColor = .lightGray
        $0.numberOfLines = 0
        $0.textAlignment = .left
        return $0
    }(UILabel(frame: CGRect(x: 30, y: vStack.frame.maxY + 32, width: view.frame.width - 105, height: 34)))
    
    private lazy var makePurpuleButton = UIButton.makePurpuleButton(title: "РЕГИСТРАЦИЯ", x: 30, y: labelAgree.frame.maxY + 51, w: view.frame.width - 60, h: 71, action: actionPurpuleButton)
    
    lazy var actionPurpuleButton = UIAction { [weak self] _ in
        guard let self = self else {return}
        
        guard let email = self.textFiledEmail.text else {return}
        guard let passcode = self.textFiledPassword.text else {return}
        
        NotificationCenter.default.post(Notification(name: Notification.Name("setRoot"), userInfo: ["vc":"second"]))
                                        
        singleton.emailUser = email
        singleton.passcodeUser = passcode
        print("\(email), \(passcode)")
        
    }
    
    private lazy var vStack = UIStackView.makeStack(addName: textFiledName, addEmail: textFiledEmail, addPasscode: textFiledPassword, y: 343,width: view.frame.width - 50 ,h: 246)
    
    
    private lazy var textFiledName = UITextField.makeTextFiled(placeholder: "Имя", rightView: UIView(frame: CGRect(x: 0, y: 0, width: 21, height: 1)))
    private lazy var textFiledEmail = UITextField.makeTextFiled(placeholder: "Почта", rightView: UIView(frame: CGRect(x: 0, y: 0, width: 21, height: 1)))
    private lazy var textFiledPassword = UITextField.makeTextFiled(placeholder: "Пароль", rightView: eyeButton, passcode: true)
    
    private lazy var haveAccLabel = UILabel.makeLilLabel(text: "Уже есть аккаунт?", x: 98, y:makePurpuleButton.frame.maxY + 29 , w: view.frame.width - 250, h: 28)
    
    private lazy var loginButton = UIButton.purpuleButton(text: "ВХОД", x: haveAccLabel.frame.minX + 40, y: haveAccLabel.frame.maxY - 23, w: view.frame.width - 100, h: 19, action: actionLoginButton)
    
    lazy var actionLoginButton = UIAction { [weak self] _ in
        guard let self = self else {return}
        NotificationCenter.default.post(Notification(name: Notification.Name("setRoot"), userInfo: ["vc":"second"]))
        
    }
    
    
    //MARK: ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .black
        
        [labelRegist, vStack, labelAgree, makePurpuleButton, haveAccLabel, loginButton].forEach{
            view.addSubview($0)
        }
        addAction()
    }
    
    func addAction() {
        eyeButton.addTarget(self, action: #selector(displayBookMark), for: .touchUpInside)
    }
    
    //MARK: - Make Action Button Eye
    @objc
    private func displayBookMark() {
        let imageName = isPrivate ? "eye.fill" : "eye.slash.fill"
        textFiledPassword.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
        isPrivate.toggle()
    }

}

