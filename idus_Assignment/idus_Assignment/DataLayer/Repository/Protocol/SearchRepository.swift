//
//  DetailPageRepository.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import UIKit

protocol SearchRepository {
    func requestIsValidAppID(appID: String, completion: @escaping (APPSearchDTO) -> Void)
    func fetchImage(with url: URL?, completion: @escaping (UIImage?) -> Void)
}
