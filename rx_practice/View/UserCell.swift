//
//  UserCell.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import UIKit

class UserCell: UITableViewCell {
    static let identifier = "userCell"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
}
