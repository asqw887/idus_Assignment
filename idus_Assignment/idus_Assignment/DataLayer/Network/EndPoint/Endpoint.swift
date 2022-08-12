//
//  Endpoint.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

enum EndPoint: Endpointable {
    
    case appDetailPage(appID: String)
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        switch self {
        case .appDetailPage:
            return "itunes.apple.com"
        }
    }
    
    var path: String {
        switch self {
        case .appDetailPage:
            return "/lookup"
        default:
            return ""
        }

    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .appDetailPage:
            return .get
        }
    }
        
    var contentType: [String: String] {
        switch self {
        case .appDetailPage:
            return ["Content-type": "application/json",
                    "Accept": "application/json"]
        }
    }
    
    var queryItems: [URLQueryItem]? {
            switch self {
            case .appDetailPage(let appID):
                return [URLQueryItem(name: "id", value: "\(appID)")]
            }
        }
        
    var url: URL? {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path

        if self.httpMethod == .get {
            components.queryItems = self.queryItems
        }

        return components.url
    }
        
}
