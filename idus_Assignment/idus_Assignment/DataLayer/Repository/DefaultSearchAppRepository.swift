//
//  DefaultDetailPageRepository.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import Foundation

final class DefaultSearchAppRepository: SearchRepository {
        
    let networkService: NetworkServiceable = NetworkService()
    
    // appID를 가지고 api요청 메소드 호출
    func requestIsValidAppID(appID: String, completion: @escaping (Bool) -> Void) {
        networkService.request(endPoint: .appDetailPage(appID: appID)) { result in
            switch result {
            case .success(let data):
                print("success")
                completion(true)
            case .failure:
                print(NetworkError.noData)
                completion(false)
            }
        }
    }
}
