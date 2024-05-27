//
//  Singlton.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 27/05/2024.
//

import Foundation


//MARK: - SinglTonModel Class
class SingltonModel {

    static let shared = SingltonModel()
    private init() {}

    var emailUser: String = ""
    var passcodeUser: String = ""
}

