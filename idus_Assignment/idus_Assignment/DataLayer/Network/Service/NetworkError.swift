//
//  NetworkError.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

enum NetworkError: Error {
    case noURL
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case encodingError(Error)
}
