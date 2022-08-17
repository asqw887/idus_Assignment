//
//  ViewDetailPageUsecase.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/17.
//

import Foundation

protocol ViewDetailPageUsecase {
    func execute(with appID: String, completion: @escaping (DetailPageEntity) -> Void)
}
