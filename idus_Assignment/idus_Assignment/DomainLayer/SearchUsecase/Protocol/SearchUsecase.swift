//
//  SearchUsecase.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/17.
//

import Foundation

protocol SearchUsecase {
    func execute(with appID: String, completion: @escaping (Bool) -> Void)
}
