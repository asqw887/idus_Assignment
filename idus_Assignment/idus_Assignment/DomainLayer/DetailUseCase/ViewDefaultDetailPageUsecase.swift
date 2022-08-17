//
//  DetailPageUsecase.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import Foundation

final class ViewDefaultDetailPageUsecase: ViewDetailPageUsecase {
    
    private var searchRepository: APPStoreDetailRepository = DefaultAppStoreDetailRepository()
    
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


private extension ViewDefaultDetailPageUsecase {
    
    func convertToEntity(from dto: DetailPageDTO, completion: @escaping (DetailPageEntity) -> Void) {
        
        var entity = DetailPageEntity()
        
        // DTO -> Entity
        convertToHeaderEntity(from: dto) { [weak self] headerEntity in
            entity.header = headerEntity
            entity.subInfo = self?.convertToSubInfoEntity(from: dto)
            entity.releaseNote = self?.convertToReleaseNoteEntity(from: dto)
            entity.description = self?.convertToDescriptionEntity(from: dto)
            entity.information = self?.convertToInformationEntity(from: dto)
            self?.convertToPreviewEntity(from: dto) { previewEntity in
                entity.preview = previewEntity
                completion(entity)
            }
        }
        
        
    }
    
    // DetailPageEntity 하위 Entity 변환
    // HeaderEntity 변환
    func convertToHeaderEntity(from dto: DetailPageDTO, completion: @escaping (HeaderEntity) -> Void) {
        let url = URL(string: dto.artworkUrl512)
        searchRepository.fetchImage(with: url) { image in
            guard let image = image else {
                return
            }
            completion(HeaderEntity(image: image, appName: dto.trackCensoredName))
        }
    }
    
    // SubInfoEntity 변환
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
    
    // ReleaseNoteEntity 변환
    func convertToReleaseNoteEntity(from dto: DetailPageDTO) -> ReleaseNoteEntity {
        let versionStr = "버전 \(dto.version)"
        //TODO: N일전으로 변경하는 로직 추가하기
        return ReleaseNoteEntity(version: versionStr, releaseDate: "3일전", releaseNote: dto.releaseNotes)
    }
    
    
    // PreviewEntity 변환
    func convertToPreviewEntity(from dto: DetailPageDTO, completion: @escaping ([PreviewEntity]) -> Void) {
        
        var previewEntites = [PreviewEntity]()
        
        dto.screenshotUrls.forEach { urlString in
            let url = URL(string: urlString)
            searchRepository.fetchImage(with: url) { image in
                guard let image = image else {
                    return
                }
                previewEntites.append(PreviewEntity(image: image))
                
                if dto.screenshotUrls.count == previewEntites.count {
                    completion(previewEntites)
                }
            }
        }
    }
    
    // DescriptionEntity 변환
    func convertToDescriptionEntity(from dto: DetailPageDTO) -> DescriptionEntity {
        return DescriptionEntity(description: dto.resultDescription, developerName: dto.sellerName)
    }
    
    // InformationEntity 변환
    func convertToInformationEntity(from dto: DetailPageDTO) -> [InformationEntity] {
        
        var infoEntities = [InformationEntity]()
        infoEntities.append(InformationEntity(title: "제공자", content: dto.sellerName))
        let megaByteSize = round(Double(dto.fileSizeBytes)! / 1024000 * 10 ) / 10
        infoEntities.append(InformationEntity(title: "크기", content: "\(megaByteSize)MB" ))
        infoEntities.append(InformationEntity(title: "카테고리", content: dto.primaryGenreName))
        // TODO: 변경해야함
        infoEntities.append(InformationEntity(title: "언어", content: dto.languageCodesISO2A.first!))
        infoEntities.append(InformationEntity(title: "연령등급", content: dto.contentAdvisoryRating))
        infoEntities.append(InformationEntity(title: "저작권", content: dto.sellerName))
        
        return infoEntities
    }

}
