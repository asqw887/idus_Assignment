//
//  SearchAPPUsecase.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import Foundation

final class SearchAPPUsecase: SearchUsecase {
    
    private var searchRepository: APPStoreDetailRepository = DefaultAppStoreDetailRepository()
    
    func execute(with appID: String, completion: @escaping (Bool) -> Void) {
        searchRepository.requestIsValidAppID(appID: appID) { appSearchDTO in
            if appSearchDTO.resultCount > 0 {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
