//
//  UserApiClient.swift
//  rx_practice
//
//  Created by 이은재 on 2023/06/07.
//

import Foundation
import RxSwift

let getUserUrl = "https://6448abcee7eb3378ca3348c8.mockapi.io/users"

protocol UserRepository {
    static func attachAllUser() -> Observable<Data>
}

extension UserRepository {
    static func attachAllUser() -> Observable<Data> {
        return Observable.create { observer in
            guard let url = URL(string: getUserUrl) else {
                observer.onError(ApiError.invalidUrl)
                return Disposables.create()
            }
            let task = URLSession.shared.dataTask(with: url) { data, result, error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                guard let data = data else {
                    observer.onError(ApiError.emptyData)
                    return
                }
                observer.onNext(data)
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

class UserRepositoryImpl : UserRepository {}
