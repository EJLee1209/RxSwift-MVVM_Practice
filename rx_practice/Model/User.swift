//
//  User.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation

struct UserResponse: Decodable {
    var users: [User]
}
struct User: Codable {
    var name: String
    var avatar: String // image url
    var gender: String // male or female
    var id: String
}
