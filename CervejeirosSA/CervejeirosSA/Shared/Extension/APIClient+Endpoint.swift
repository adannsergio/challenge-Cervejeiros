//
//  APIClient+Endpoint.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 20/02/23.
//

import Foundation

extension APIClient {
    struct Endpoint {
        let baseURL: URL
        let path: String
        let httpMethod: String
        let queryItens: [String: Any]?

        init(baseUrl: URL = URL(string: "https://api.punkapi.com/v2")!,
             path: String,
             httpMethod: String,
             queryItens: [String : Any]?) {
            self.baseURL = baseUrl
            self.path = path
            self.httpMethod = httpMethod
            self.queryItens = queryItens
        }

        func asURLRequest() throws -> URLRequest {
            var urlComponents = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            
            if let urlParameters = queryItens {
                urlComponents?.queryItems = urlParameters.map { key, value in
                    URLQueryItem(name: key, value: String(describing: value))
                }
            }
            
            guard let url = urlComponents?.url else {
                throw ClientError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod

            return request
        }
    }
}
