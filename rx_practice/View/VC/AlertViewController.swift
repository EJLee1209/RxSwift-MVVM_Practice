//
//  AlertViewController.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AlertViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var alertBtn: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    lazy var alert : UIAlertController = createAlert()
    lazy var viewModel = AlertViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.counter
            .map{ "\($0)" }
            .subscribe(onNext: { [weak self] in
                self?.countLabel.text = $0
            })
            .disposed(by: disposeBag)
        
        alertBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.present(self!.alert, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func createAlert() -> UIAlertController {
        let alert = UIAlertController(
            title: "시스템 메세지",
            message: "값 증가 or 감소",
            preferredStyle: .alert
        )
        let increaseAction = UIAlertAction(title: "증가", style: .default) { action in
            // 증가 action
            self.viewModel.increaseCount(increase: +1)
        }
        let decreaseAction = UIAlertAction(title: "감소", style: .default) { action in
            // 감소 action
            self.viewModel.increaseCount(increase: -1)
        }
        alert.addAction(increaseAction)
        alert.addAction(decreaseAction)
        return alert
    }
}
