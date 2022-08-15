//
//  DetailPageUsecase.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import Foundation

final class DetailPageUsecase {
    
    // TODO: 네이밍 변경
    private var searchRepository: SearchRepository = DefaultSearchAppRepository()
    
    func execute(with appID: String, completion: @escaping (DetailPageEntity) -> Void) {
        searchRepository.requestIsValidAppID(appID: appID) {[weak self] appSearchDTO in
            
            guard let detailPageDTO = appSearchDTO.results.first else { print(NetworkError.noData)
                return }
            guard let entity = self?.convertToEntity(from: detailPageDTO) else { return }
            completion(entity)
        }
    }
    
}


private extension DetailPageUsecase {
    
    func convertToEntity(from dto: DetailPageDTO) -> DetailPageEntity {
        return DetailPageEntity(header: convertToHeaderEntity(from: dto))
    }
    
    func convertToHeaderEntity(from dto: DetailPageDTO) -> HeaderEntity {
        return HeaderEntity(image: URL(string: dto.artworkUrl512)!, appName: dto.trackCensoredName)
    }
    
}
