//
//  Models.swift
//  DZ_1_modul_3
//
//  Created by Nikita Shipovskiy on 26/05/2024.
//

import Foundation

struct ItemModel {
    
    var id = UUID().uuidString
    var name: String
    
    static func mockData() -> [ItemModel] {
        [
            ItemModel.init(name: ""),
            ItemModel.init(name: ""),
            ItemModel.init(name: ""),
        ]
    }
}
