//
//  Utils.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString: String) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlString) else {
                return
            }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
