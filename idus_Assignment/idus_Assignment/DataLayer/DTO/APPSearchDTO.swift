//
//  APPSearchDTO.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

struct APPSearchDTO: Codable {
    let resultCount: Int
    let results: [DetailPageDTO]
}
