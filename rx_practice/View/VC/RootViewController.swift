//
//  RootViewController.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RootViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        // viewModel의 MenuItems Observable을 구독 -> tableView 연결
        Observable.just(MenuItem.mock)
            .bind(to: tableView.rx.items(
                cellIdentifier: MenuCell.identifier,
                cellType: MenuCell.self)
            ) { index, item, cell in
                cell.title.text = item.title
            }
            .disposed(by: disposeBag)
        
        // itemSelected를 통해 tableView의 item 클릭 이벤트 처리
        tableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                // cell 가져와서 해당 cell에 적합한 화면 전환 수행
                if let cell = self.tableView.cellForRow(at: indexPath) as? MenuCell {
                    switch cell.title.text {
                    case "Number Counter":
                        self.performSegue(withIdentifier: "RootToCounter", sender: nil)
                    case "NetWorking With MockApi(GET)":
                        self.performSegue(withIdentifier: "RootToUser", sender: nil)
                    case "Alert":
                        self.performSegue(withIdentifier: "RootToAlert", sender: nil)
                    default:
                        break
                    }
                }
                
                // 선택 해제
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
