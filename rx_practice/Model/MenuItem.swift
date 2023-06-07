//
//  MenuItem.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation

struct MenuItem {
    var title: String
    
    static var mock: [Self] {
        return [
            MenuItem(title: "Number Counter"),
            MenuItem(title: "NetWorking With MockApi(GET)"),
        ]
    }
}
