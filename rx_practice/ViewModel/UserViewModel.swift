//
//  UserViewModel.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation
import RxSwift

class UserViewModel {
    let users = BehaviorSubject<[User]>(value: [])
    let disposeBag = DisposeBag()
    
    init() {
        _ = UserRepositoryImpl.attachAllUser()
            .map { data in
                do {
                    let result = try JSONDecoder().decode([User].self, from: data)
                    return result
                } catch {
                    print("attachAllUser() 오류 발생 : \(error)")
                    return []
                }
            }
            .take(1)
            .bind(to: users)
    }
}
