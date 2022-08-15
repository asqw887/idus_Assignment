//
//  DetailPageRepository.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import Foundation

protocol SearchRepository {
    func requestIsValidAppID(appID: String, completion: @escaping (APPSearchDTO) -> Void)
}
