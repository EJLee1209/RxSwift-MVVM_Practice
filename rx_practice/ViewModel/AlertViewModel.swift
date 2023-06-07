//
//  AlertViewModel.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation
import RxSwift
class AlertViewModel {
    let counter = BehaviorSubject<Int>(value: 0)
    
    func increaseCount(increase:Int) {
        _ = counter.map { $0 + increase}
            .take(1)
            .subscribe(onNext: {
                self.counter.onNext($0)
            })
    }
    
}
