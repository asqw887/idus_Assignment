//
//  String +.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/17.
//

import Foundation

extension String {
    // withFormat : "yyyy-MM-dd'T'HH:mm:SSZ"
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSZ"
        let date = dateFormatter.date(from: self)
        return date
    }
}
