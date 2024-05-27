//
//  ProfileViewController.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import UIKit

//MARK: - Profile ViewController
final class ProfileViewController: UIViewController{
    
    var singleton = SingltonModel.shared

    private lazy var myProfileLabel = UILabel.makeProfileLabel(text: "Мой профиль", sizeFont: 35, alignment: .left, x: 25, y: 30, w: view.frame.width - 50, h: 84)
    
    private lazy var imageProfile: UIImageView = {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 74
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(frame: CGRect(x: 140, y: 258, width: 148, height: 148)))
    
    private lazy var emailProfile = UILabel.makeProfileLabel(text: "Email пользователя", sizeFont: 28, alignment: .left, x: 30, y: 459, w: view.frame.width - 60, h: 28)
    
    
    
    private lazy var myAccount = UIButton.profileButton(title: "Мой аккаунт", img: .profileIcon, action: actionMyAccount)
    private lazy var settiongButton = UIButton.profileButton(title: "Настройки", img: .settings, action: actionSettings)
    private lazy var supportButton = UIButton.profileButton(title: "Помощь", img: .messageDZ1, action: supprontAction)
    
    lazy var actionMyAccount = UIAction { [weak self] _ in
        guard let self = self else {return}
        let alert = UIAlertController(title: "Ваш аккаунт", message: "Email: \(singleton.emailUser)  Password: \(singleton.passcodeUser)", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
      
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    lazy var actionSettings = UIAction { [weak self] _ in
        print("Настройки")
    }
    
    lazy var supprontAction = UIAction { [weak self] _ in
        print("Сообщение")
    }
    
    
    private lazy var vStack = UIStackView.makeStack(addName: myAccount, addEmail: settiongButton, addPasscode: supportButton, x: 70 , y: emailProfile.frame.maxY + 43, width: view.frame.width - 140, h: 151, spacing: 10)
    
    private lazy var exitButton = UIButton.profileButton(title: "Выход", img: .init(), x: 70, y: vStack.frame.maxY + 130, w: view.frame.width - 140, contentH: .center, titileSetting: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), action: exiteAction)
    
    lazy var exiteAction = UIAction { [weak self] _ in
        NotificationCenter.default.post(Notification(name: Notification.Name("setRoot"), userInfo: ["vc": "second"]))
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        emailProfile.text = singleton.emailUser
        [myProfileLabel, imageProfile, emailProfile, vStack, exitButton].forEach{
            view.addSubview($0)
        }
    }
}
