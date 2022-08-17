//
//  DetailViewModel.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import Foundation

final class DetailViewModel {
    
    private var detailPageUsecase: ViewDetailPageUsecase = ViewDefaultDetailPageUsecase()
    var detaPageData: Observable<DetailPageEntity?> = Observable(nil)
    
    func enquireAllData(with appID: String) {
        detailPageUsecase.execute(with: appID) { [weak self] detailPageEntity in
            self?.detaPageData.updateValue(value: detailPageEntity)
        }
    }
    
}
