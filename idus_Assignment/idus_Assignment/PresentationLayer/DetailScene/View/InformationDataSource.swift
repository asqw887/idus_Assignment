//
//  InformationDataSource.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/16.
//

import UIKit

class InformationDataSource: NSObject, UITableViewDataSource {
    
    var informationEntity: [InformationEntity] = [InformationEntity]()
    
    init(entity: [InformationEntity]) {
        informationEntity = entity
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationEntity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InformationCell.reuseIdentifier, for: indexPath) as? InformationCell else { return UITableViewCell() }
        cell.set(entity: informationEntity[indexPath.row])
        return cell
    }
    
    
}
