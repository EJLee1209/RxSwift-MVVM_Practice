//
//  ViewModel.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation
import RxSwift

class CounterViewModel {
    let disposeBag = DisposeBag()
    
    let counter = BehaviorSubject<Int>(value: 0)
    let tappedPlusBtn = PublishSubject<Void>()
    let tappedMinusBtn = PublishSubject<Void>()
    
    init() {
        tappedPlusBtn.asObserver()
            .subscribe(onNext: { self.increaseCount(increase: 1) })
            .disposed(by: disposeBag)
        
        tappedMinusBtn.asObserver()
            .subscribe(onNext: { self.increaseCount(increase: -1) })
            .disposed(by: disposeBag)
    }
    
    func increaseCount(increase: Int) {
        _ = counter.map {
            $0 + increase
        }
        .take(1)
        .subscribe(onNext: {
            self.counter.onNext($0)
        })
    }
}
