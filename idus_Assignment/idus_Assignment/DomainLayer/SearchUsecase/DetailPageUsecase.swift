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
            
            self?.convertToEntity(from: detailPageDTO, completion: { entity in
                completion(entity)
            })
            
        }
    }
    
}


private extension DetailPageUsecase {
    
    func convertToEntity(from dto: DetailPageDTO, completion: @escaping (DetailPageEntity) -> Void) {
        
        DispatchQueue.global().async { [weak self] in
            var entity = DetailPageEntity()
            
            self?.convertToHeaderEntity(from: dto) { headerEntity in
                entity.header = headerEntity
                completion(entity)
            }
        }
        
    }
    
    func convertToHeaderEntity(from dto: DetailPageDTO, completion: @escaping (HeaderEntity) -> Void) {
        let url = URL(string: dto.artworkUrl512)
        searchRepository.fetchImage(with: url) { image in
            guard let image = image else {
                return
            }
            completion(HeaderEntity(image: image, appName: dto.trackCensoredName))
        }
        
    }
    
}
