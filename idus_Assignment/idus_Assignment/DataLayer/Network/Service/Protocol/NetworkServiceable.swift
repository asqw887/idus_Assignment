//
//  NetworkServiceable.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

protocol NetworkServiceable {
    func request(endPoint: EndPoint, completion: @escaping (Result<Data, NetworkError>) -> Void)
    func requestImage(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
}
