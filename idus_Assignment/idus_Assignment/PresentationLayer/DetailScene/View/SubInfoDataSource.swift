//
//  SubInfoDataSource.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import UIKit

class SubInfoDataSource: NSObject, UICollectionViewDataSource {
    
    var subInfoEntity: [SubInfoEntity] = [SubInfoEntity]()
    
    init(entity: [SubInfoEntity]) {
        subInfoEntity = entity
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subInfoEntity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubInfoCell.reuseIdentifier, for: indexPath) as? SubInfoCell else { return UICollectionViewCell() }
        cell.set(entity: subInfoEntity[indexPath.item])
        return cell
    }
    
    
}
