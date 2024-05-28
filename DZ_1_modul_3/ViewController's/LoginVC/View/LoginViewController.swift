//
//  LoginViewController.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

//MARK: - Login ViewController

final class LoginViewController: UIViewController {

    private lazy var eyeButton = EyeButton()
    private var isPrivate = true
    var singleton = SingltonModel.shared
    
    private lazy var labelLogin = UILabel.makeLabel(text: "Войти", x: 150, y: 319, w: view.frame.width - 300, h: 41)
    
    private lazy var vStack: UIStackView = {
        $0.addArrangedSubview(textFiledEmail)
        $0.addArrangedSubview(textFiledPassword)
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 15
        return $0
    }(UIStackView(frame: CGRect(x: 30, y: 385, width: view.frame.width - 60, height: 161)))
    
    
    private lazy var textFiledEmail = UITextField.makeTextFiled(placeholder: "Почта", rightView: UIView(frame: CGRect(x: 0, y: 0, width: 21, height: 1)))
    private lazy var textFiledPassword = UITextField.makeTextFiled(placeholder: "Пароль", rightView: eyeButton, passcode: true)
    
    private lazy var purpureButton = UIButton.makePurpuleButton(title: "Войти", x: 30, y: vStack.frame.maxY + 60, w: view.frame.width - 60, h: 71, action: actionPurpuleButton)
    
    lazy var actionPurpuleButton = UIAction { [weak self] _ in
        
        guard let self = self else {return}
        
        if textFiledEmail.text == singleton.emailUser && textFiledPassword.text == singleton.passcodeUser {
            NotificationCenter.default.post(Notification(name: Notification.Name("setRoot"), userInfo: ["vc":"profile"]))
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Не правильно ввели данные", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
          
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    private lazy var notHaveAccLabel = UILabel.makeLilLabel(text: "У вас нет аккаунт?", x: 72, y:purpureButton.frame.maxY + 29 , w: view.frame.width - 124, h: 28)
    
    private lazy var registerButton = UIButton.purpuleButton(text: "РЕГИСТРАЦИЯ", x:   notHaveAccLabel.frame.minX + 80, y: notHaveAccLabel.frame.maxY - 23, w: view.frame.width - 100, h: 19, action: actionRegistButton)
    
    lazy var actionRegistButton = UIAction { [weak self] _ in
        NotificationCenter.default.post(Notification(name: Notification.Name("setRoot"), userInfo: ["vc": "sing"]))
    }
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .black
        
        [labelLogin, vStack, purpureButton, notHaveAccLabel, registerButton].forEach{
            view.addSubview($0)
            
            addAction()
        }
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
