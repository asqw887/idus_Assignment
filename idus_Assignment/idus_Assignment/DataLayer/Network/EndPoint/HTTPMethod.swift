//
//  HTTPMethod.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

enum HTTPMethod: String {
    case get, post

    var value: String {
        self.rawValue.uppercased()
    }
}
