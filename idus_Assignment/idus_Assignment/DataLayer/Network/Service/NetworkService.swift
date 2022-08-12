//
//  NetworkService.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/12.
//

import Foundation

struct NetworkService: NetworkServiceable {

    func request(endPoint: EndPoint, completion: @escaping (Result<Data, NetworkError>) -> Void) {

        let request = makeURLRequest(with: endPoint)
        switch request {
        case .failure:
            completion(.failure(.noURL))

        case .success(let request):
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse else { return }

                if let error = error {
                    completion(.failure(.transportError(error)))
                    return
                }

                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                    return
                }

                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }

                completion(.success(data))
            }.resume()
        }
    }

    func requestImage(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return }

            if let error = error {
                completion(.failure(.transportError(error)))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            completion(.success(data))
        }.resume()
    }
}

private extension NetworkService {

    func makeURLRequest(with target: EndPoint) -> Result<URLRequest, NetworkError> {
        guard let url = target.url else { return .failure(.noData) }

        var request = URLRequest(url: url)
        
        target.contentType.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        request.httpMethod = target.httpMethod.value

        switch target.httpMethod {
        case .post:
            let param: [String: String] = (target.queryItems ?? []).reduce(into: [:]) { params, queryItem in
                params[queryItem.name] = queryItem.value

            }
            let formDataString = (param.compactMap({ (key, value) -> String in
              return "\(key)=\(value)"
            }) as Array).joined(separator: "&")

            let formEncodedData = formDataString.data(using: .utf8)
            request.httpBody = formEncodedData

        default:
            break
        }

        return .success(request)
    }
}
