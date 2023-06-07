//
//  ViewController.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import UIKit
import RxSwift
import RxCocoa

class CounterViewController: UIViewController {
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var counter: UILabel!
    
    let disposeBag = DisposeBag()
    let viewModel = CounterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // + 버튼 클릭 이벤트
        plusBtn.rx.tap
            .bind(to: viewModel.tappedPlusBtn) // viewModel로 이벤트 전달
            .disposed(by: disposeBag)
        
        // - 버튼 클릭 이벤트
        minusBtn.rx.tap
            .bind(to: viewModel.tappedMinusBtn) // viewModel로 이벤트 전달
            .disposed(by: disposeBag)
        
        // 숫자 카운터
        viewModel.counter
            .map { "\($0)" } // Int -> String
            .bind(to: counter.rx.text) // UI 업데이트
            .disposed(by: disposeBag)
    }


}

