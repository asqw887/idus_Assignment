//
//  SearchViewModel.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

final class SearchViewModel {
    
    var isValidAppID: Observable<Bool> = Observable(false)
    
    private var searchUsecase: SearchUsecase = SearchAPPUsecase()
    
    func searchAppID(with appID: String){
        searchUsecase.execute(with: appID) { [weak self] isValid in
            self?.isValidAppID.updateValue(value: isValid)
        }
    }
}
