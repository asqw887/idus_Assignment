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
        
        var entity = DetailPageEntity()
        
        convertToHeaderEntity(from: dto) { headerEntity in
            entity.header = headerEntity
            completion(entity)
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
    
    func convertToSubInfoEntity(from dto: DetailPageDTO) -> [SubInfoEntity] {
        var subInfoEntites = [SubInfoEntity]()
        
        subInfoEntites.append(SubInfoEntity(title: "평가", content: "\(round(dto.averageUserRating * 10) / 10)", footer: "★★★★★"))
        subInfoEntites.append(SubInfoEntity(title: "연령", content: dto.contentAdvisoryRating, footer: "세"))
        subInfoEntites.append(SubInfoEntity(title: "개발자", content: nil, footer: dto.artistName))
        
        let languageContent: String = dto.languageCodesISO2A.contains("KO") ? "KO" : dto.languageCodesISO2A.first!
        let languageCountStr: String = dto.languageCodesISO2A.count == 1 ? "" : "+\(dto.languageCodesISO2A.count - 1)개 언어"
        subInfoEntites.append(SubInfoEntity(title: "언어", content: languageContent, footer: languageCountStr))

        return subInfoEntites
    }
    
    
}
