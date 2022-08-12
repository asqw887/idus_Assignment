//
//  Endpointable.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

protocol Endpointable {
    var scheme: String {get}
    var host: String {get}
    var path: String {get}
    var httpMethod: HTTPMethod {get}
    var contentType: [String: String] {get}
    var queryItems: [URLQueryItem]? {get}
    var url: URL? {get}
}
