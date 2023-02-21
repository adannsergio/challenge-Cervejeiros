//
//  APIClient.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 20/02/23.
//


protocol APIClientProtocol {
    func request<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
    func downloadImageData(request: URLRequest, completion: ((Data?) -> Void)?)
}

import Foundation

class APIClient: APIClientProtocol {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(request: URLRequest,
                               completion: @escaping (Result<T, Error>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ClientError.unknownError))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func downloadImageData(request: URLRequest, completion: ((Data?) -> Void)? = nil) {
        let task = session.dataTask(with: request) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data else {
                completion?(nil)
                return
            }
            completion?(data)
        }
        task.resume()
    }
}
