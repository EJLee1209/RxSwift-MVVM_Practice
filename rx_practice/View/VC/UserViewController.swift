//
//  UserViewController.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class UserViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    var viewModel = UserViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingIndicator.startAnimating()
        // 유저 데이터 관찰(UserViewModel 생성시 유저 데이터를 가져오는 api 자동 호출)
        viewModel.users
            .bind(to: tableView.rx.items(
                cellIdentifier: UserCell.identifier,
                cellType: UserCell.self)
            ) { _, item, cell in
                cell.nameLabel.text = item.name
                cell.avatarImageView.load(urlString: item.avatar)
                switch item.gender {
                case "male":
                    cell.genderImageView.image = UIImage(systemName: "hand.thumbsdown.fill")
                case "female":
                    cell.genderImageView.image = UIImage(systemName: "hand.thumbsup.fill")
                default:
                    cell.genderImageView.image = UIImage(systemName: "questionmark.circle")
                }
                self.loadingIndicator.isHidden = true
            }
            .disposed(by: disposeBag)
        
        // tableView item 클릭 이벤트
        tableView.rx.itemSelected
            .subscribe { indexPath in
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
