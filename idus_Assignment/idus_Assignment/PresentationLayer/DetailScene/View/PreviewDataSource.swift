//
//  PreviewDataSource.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import Foundation

import UIKit

class PreviewDataSource: NSObject, UICollectionViewDataSource {
    
    var previewEntity: [PreviewEntity] = [PreviewEntity]()
    
    init(entity: [PreviewEntity]) {
        previewEntity = entity
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return previewEntity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCell.reuseIdentifier, for: indexPath) as? PreviewCell else { return UICollectionViewCell() }
        cell.set(entity: previewEntity[indexPath.item])
        return cell
    }
    
    
}
